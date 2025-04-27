resource "aws_lambda_function" "hello_world" {
  function_name = "HelloWorldLambda"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.handler"
  filename      = "function.zip"

}
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}