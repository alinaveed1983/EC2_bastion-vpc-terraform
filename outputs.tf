output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_ec2_id" {
  value = module.ec2_bastion.instance_id
}
