resource "aws_instance" "bastion" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      Name = "bastion-terraform"
    }
    vpc_security_group_ids = [aws_security_group.sec-gr-1.id]
}
resource "aws_instance" "app" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_subnet.id
    tags = {
      Name = "app-terraform"
    }
    vpc_security_group_ids = [aws_security_group.sec-gr-2.id]
  
}