resource "aws_security_group" "sec-gr-1" {
    name        = "sec_gr-1"
    vpc_id      = aws_vpc.main.id
    tags = {
      Name = "sec-gr-1"
    }
}
    resource "aws_security_group_rule" "allow-pub-ssh" {
        type              = "ingress"
        from_port         = 22
        to_port           = 22
        protocol          = "tcp"
        security_group_id = aws_security_group.sec-gr-1.id
        cidr_blocks       = ["0.0.0.0/0"]
        description       = "Allow SSH from anywhere"
      
    }


resource "aws_security_group" "sec-gr-2" {
    name        = "sec_gr-2"
    vpc_id      = aws_vpc.main.id
    tags = {
      Name = "sec-gr-2"
    }
}
    resource "aws_security_group_rule" "allow-ssh-vpc" {
        type              = "ingress"
        from_port         = 22
        to_port           = 22
        protocol          = "tcp"
        security_group_id = aws_security_group.sec-gr-2.id
        cidr_blocks       = [aws_vpc.main.cidr_block]
        description       = "Allow SSH from VPC"
  
}
resource "aws_security_group_rule" "allow-port-vpc" {
    type              = "ingress"
    from_port         = 3000
    to_port           = 3000
    protocol          = "tcp"
    security_group_id = aws_security_group.sec-gr-2.id
    cidr_blocks       = [aws_vpc.main.cidr_block]

  
}