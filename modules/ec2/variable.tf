variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-00a929b66ed6e0de6"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be created"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  default     = "rds-ec2"
}
