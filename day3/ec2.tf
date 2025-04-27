resource "aws_instance" "bastion" {
    ami = data.aws_ami.latest_ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnets["public_subnet"].id
    associate_public_ip_address = true
    tags = {
      Name = "bastion-terraform"
    }
    provisioner "local-exec" {
        command = "echo 'Bastion instance created with public IP: ${self.public_ip}'> bastion_ip.txt"
      
    }
    vpc_security_group_ids = [aws_security_group.sec-gr-1.id]
}
resource "aws_instance" "app" {
    ami = data.aws_ami.latest_ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnets["private_subnet"].id
    tags = {
      Name = "app-terraform"
    }
    vpc_security_group_ids = [aws_security_group.sec-gr-2.id]
  
}