resource "aws_iam_role" "lambda_exec" { #lambda execution role
  name = "${terraform.workspace}-lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ses_policy" {# allow sending emails using SES
  name = "AllowSESSendEmail"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "ses:SendEmail",
        "ses:SendRawEmail"
      ],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}
resource "aws_iam_role_policy_attachment" "lambda_ses_attach" { #attach SES policy to the lambda execution role
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.ses_policy.arn
}


resource "aws_lambda_function" "send_email" { #lambda function which which will run python code 
  function_name = "send_email"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "lambda_function.zip"

  environment {
    variables = {
      SOURCE_EMAIL     = "hanaahmedd902@gmail.com"
      DESTINATION_EMAIL = "hanaahmedd902@gmail.com"
      ENVIRONMENT      = module.network.region
    }
  }

  tags = {
    Name = "${terraform.workspace}-send-email-lambda"
  }
  
}

resource "aws_s3_bucket" "lambda_bucket" { #creation of S3 bucket to upload objects(trigger event for lambda function)
  bucket = "terraform-bucket-hana-send-email"
}
resource "aws_lambda_permission" "allow_s3" {#allow s3 to invoke lambda function when object is uploaded 
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.send_email.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.lambda_bucket.arn
  
}
resource "aws_s3_bucket_notification" "lambda_notification" {# connect s3 bucket to lambda function and trigger on any object upload 
  bucket = aws_s3_bucket.lambda_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.send_email.arn
    events             = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_lambda_permission.allow_s3]
}