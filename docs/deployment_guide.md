# Deployment Guide

> This repository is a portfolio lab. Review cost and security implications before deploying to a real AWS account.

## Prerequisites
- Terraform
- AWS CLI
- An AWS account you control
- AWS credentials configured outside the repository

## Commands

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

## Cleanup

```bash
terraform destroy
```

## Cost Warning
Resources such as NAT Gateway and Application Load Balancer can incur charges even in a small lab. Destroy the environment when not in use.

## Never Commit
- AWS access keys
- Secret keys
- `.terraform/`
- `terraform.tfstate`
- `terraform.tfvars` if it contains sensitive values
