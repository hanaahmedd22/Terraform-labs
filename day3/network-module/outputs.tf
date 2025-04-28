output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_ids" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
}
output "security_group_1_id" {
  value = aws_security_group.sec-gr-1.id
  
}
output "security_group_2_id" {
  value = aws_security_group.sec-gr-2.id
}
output "region" {
    value = var.region

  
}