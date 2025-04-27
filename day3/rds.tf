resource "aws_db_instance" "default" {
    allocated_storage = 10
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    db_name = "defaultdb"
    username = "admin"
    password = "password"
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.default.name
  tags = {
    Name = "${terraform.workspace}-default-db-instance"
  }
  
}
resource "aws_db_subnet_group" "default" {
    name       = "${terraform.workspace}-default-db-subnet-group"
    subnet_ids = [aws_subnet.subnets["private_subnet"].id, aws_subnet.subnets["private_subnet_2"].id]
    tags = {
      Name = "${terraform.workspace}-default-db-subnet-group"
    }
  
}