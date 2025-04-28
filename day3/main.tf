module "network" {
  source = "./network-module"
    vpc_cidr = var.vpc_cidr
    subnet_list = var.subnet_list
    region = var.region
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr

  
}