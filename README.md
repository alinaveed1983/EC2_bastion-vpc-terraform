# EC2 Bastion with VPC - Terraform

This repository contains Terraform code to provision EC2 Bastion instances within a VPC.  
Multiple EC2 instances can be created using the same reusable code by providing different input variables.

---

## Architecture Diagram
![image](https://github.com/user-attachments/assets/90e5976c-eeee-4231-8fc5-d3476e89d3ad)

---

## Terraform Project Flow

```
terraform.tfvars
    ↓
variables.tf (root)
    ↓
main.tf (root)
    ↓
Modules/
│
├── modules/vpc/
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
│
└── modules/ec2/
    ├── variables.tf
    ├── main.tf
    └── outputs.tf
    ↓
outputs.tf (root)
```


## Steps to Add Another EC2 Instance

To add a new EC2 instance, make the necessary changes in the following Terraform files:

- `main.tf`
- `outputs.tf`
- `variables.tf`
- `terraform.tfvars`

---

> **Note:**  
> While adding a new EC2 instance, ensure to provide unique values for:
> - `instance_name`
> - `ami_id`
> - `instance_type`

This helps to avoid any conflict and ensures a clean deployment.
