region              = "us-east-1"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
vpc_cidr            = "10.0.0.0/16"
instance_type       = "t2.micro"
subnet_list = [
  {
    name = "public_subnet"
    cidr = "10.0.1.0/24"
    zone = "us-east-1a"
  },
  {
    name = "private_subnet"
    cidr = "10.0.2.0/24"
    zone = "us-east-1a"
  },{
    name = "private_subnet_2"
    cidr = "10.0.3.0/24"
    zone = "us-east-1b"
  }
]