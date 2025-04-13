module "vpc" {
  source = "./modules/vpc"
}

module "ec2_bastion" {
  source        = "./modules/ec2"
  ami_id        = "ami-00a929b66ed6e0de6"
  instance_name = "web-server"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnet_1_id
}