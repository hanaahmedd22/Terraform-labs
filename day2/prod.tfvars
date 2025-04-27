region              = "eu-central-1"
public_subnet_cidr  = "10.1.1.0/24"
private_subnet_cidr = "10.1.2.0/24"
vpc_cidr            = "10.1.0.0/16"
instance_type       = "t2.micro"
subnet_list = [
  {
    name = "public_subnet"
    cidr = "10.1.1.0/24"
    zone = "eu-central-1a"
  },
  {
    name = "private_subnet"
    cidr = "10.1.2.0/24"
    zone = "eu-central-1a"
  },
  {
    name = "private_subnet_2"
    cidr = "10.1.3.0/24"
    zone = "eu-central-1b"
  }
]