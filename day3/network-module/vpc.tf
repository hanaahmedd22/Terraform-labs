resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "${terraform.workspace}-main-vpc"
    }
  
}