# resource "aws_subnet" "public_subnet" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "main-public-subnet"
#   }
  
# }
# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#     availability_zone = "us-east-1a"
#     tags = {
#       Name = "main-private-subnet"
#     }
# }
resource "aws_subnet" "subnets" {
  for_each = { for subnet in var.subnet_list : subnet.name => subnet }

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.zone
  tags = {
    Name = each.value.name
  }
}

