# EC2_bastion-vpc-terraform
This repository contains Terraform code to provision EC2 Bastion instances within a VPC.
We can create multiple EC2 instances using the same code by providing different input variables.

# Architecture Diagram
![image](https://github.com/user-attachments/assets/90e5976c-eeee-4231-8fc5-d3476e89d3ad)

Steps to Add Another EC2 Instance
To add another EC2 instance, update the following Terraform files:

main.tf

outputs.tf

variables.tf

terraform.tfvars
