vpc_cidr_block           = "10.1.0.0/26"
vpc_name                 = "my-prod-vpc1"

public_subnet_1_cidr     = "10.1.0.0/28"
public_subnet_2_cidr     = "10.1.0.16/28"
private_subnet_1_cidr    = "10.1.0.32/28"
private_subnet_2_cidr    = "10.1.0.48/28"

nat_gw_name              = "my-prod-nat"
igw_name                 = "my-prod-igw"
main_rt_name             = "prod-main-rt"
private_rt_name          = "prod-private-rt"