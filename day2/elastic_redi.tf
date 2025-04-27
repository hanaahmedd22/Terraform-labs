resource "aws_elasticache_subnet_group" "my-elastic-cache-subnet-group" {
  name       = "${terraform.workspace}-elasticache-subnet-group"
  subnet_ids = [aws_subnet.subnets["private_subnet"].id, aws_subnet.subnets["private_subnet_2"].id]
  tags = {
    Name = "${terraform.workspace}-elasticache-subnet-group"
  }
  
}
resource "aws_elasticache_cluster" "example" {
  cluster_id           = "${terraform.workspace}-elasticache-cluster"
  engine              = "redis"
  node_type           = "cache.t3.micro"
  num_cache_nodes     = 1
  port                = 6379
  subnet_group_name   = aws_elasticache_subnet_group.my-elastic-cache-subnet-group.name
  security_group_ids  = [aws_security_group.sec-gr-2.id]
  
  tags = {
    Name = "${terraform.workspace}-elasticache-cluster"
  }
  
}