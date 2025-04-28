
variable "subnet_list" {
  description = "List of subnets with their CIDR blocks and availability zones"
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
}
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
  
}