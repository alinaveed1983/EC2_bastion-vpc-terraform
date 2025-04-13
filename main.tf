module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block        = var.vpc_cidr_block
  vpc_name              = var.vpc_name
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  nat_gw_name           = var.nat_gw_name
  igw_name              = var.igw_name
  main_rt_name          = var.main_rt_name
  private_rt_name       = var.private_rt_name
}

module "ec2_bastion" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_1_id
}
