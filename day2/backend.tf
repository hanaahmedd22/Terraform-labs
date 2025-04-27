terraform {
  backend "s3" {
    bucket         = "terraform-bucket-hana"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    profile = "default"

    
  }
}