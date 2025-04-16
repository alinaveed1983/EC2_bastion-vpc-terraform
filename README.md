# EC2 Bastion with VPC - Terraform

This repository contains Terraform code to provision EC2 Bastion instances within a VPC.  
Multiple EC2 instances can be created using the same reusable code by providing different input variables.

---

## Architecture Diagram
```
EC2_bastion-vpc-terraform/
├── main.tf                  # Module calls
├── outputs.tf               # Aggregated outputs
├── provider.tf              # AWS region & profile
├── terraform.tfvars         # All environment-specific inputs
├── variable.tf              # All declared inputs used by modules
├── README.md
│
├── modules/
│   ├── ec2/                 # Generic EC2 instance creator
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variable.tf
│
│   ├── ssm_role/            # Shared IAM role for all EC2 instances
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variable.tf
│
│   └── vpc/                 # Custom VPC and Subnets
│       ├── main.tf
│       ├── outputs.tf
│       └── variable.tf
```
---

## Data Flow Diagram

```
terraform.tfvars
    └─┐
     ▼
variables.tf (root)
     └─┐
      ▼
main.tf (root)
 ├────┬───────────────────────────────────────────────────────────────┐
 ▼    ▼                                                               ▼
module "vpc"                                                  module "ssm_role"
 │                                                             │
 ▼                                                             ▼
modules/vpc/variables.tf                                modules/ssm_role/variables.tf
 │                                                             │
 ▼                                                             ▼
modules/vpc/main.tf                                     modules/ssm_role/main.tf
 │                                                             │
 ▼                                                             ▼
modules/vpc/outputs.tf                                  modules/ssm_role/outputs.tf
         │                                                         │
         └─────────────────────────────────────────────┬──────────┘
                                                       ▼
                                               main.tf (root)
                                       passes shared value to →
                                                   ▼
                                            module "ec2_bastion_1"
                                                   │
                                                   ▼
                                         modules/ec2/variables.tf
                                                   │
                                                   ▼
                                          modules/ec2/main.tf
                                                   │
                                                   ▼
                                          modules/ec2/outputs.tf
                                                   │
                                                   ▼
                                            outputs.tf (root)


```

## Note
```
1. root/terraform.tfvars → only talks to root/variables.tf
2. Module cannot see these values unless you pass them explicitly in root/main.tf
3. Terraform philosophy: Modules should never have their own tfvars. Bad for larger projects, bad for teams, and breaks scalability.
```

## Steps to Add Another EC2 Instance

To add a new EC2 instance, make the necessary changes in the following Terraform files:

- `main.tf`
- `outputs.tf`
- `variables.tf`
- `terraform.tfvars`

Commands
```
terraform init
terraform plan
terraform apply
terraform destroy
```

---

> **Note:**  
> While adding a new EC2 instance, ensure to provide unique values for:
> - `instance_name`
> - `ami_id`
> - `instance_type`

This helps to avoid any conflict and ensures a clean deployment.
