# AWS Secure Cloud Architecture

A portfolio project demonstrating a **secure, scalable and observable AWS application architecture** using VPC segmentation, IAM, Application Load Balancing, Auto Scaling, CloudWatch, VPC Flow Logs and Terraform.

> **Portfolio status:** This repository is an infrastructure-as-code and architecture demonstration. It does not represent a production system operated for MAS Tech, SalesmanForYou, Smart IMS, or any client.

## Business Problem

A single public EC2 server creates avoidable risks:

- Direct internet exposure
- Single point of failure
- Manual scaling
- Weak administrative controls
- Limited operational visibility
- Difficult recovery
- Configuration drift

This project redesigns that workload using layered AWS architecture and Infrastructure as Code.

## Architecture

```text
Internet
   |
Route 53
   |
Application Load Balancer
   |
+-----------------------------+
| VPC across two AZs          |
|                             |
| Public: ALB + NAT Gateway   |
|                             |
| Private:                    |
| EC2 <-- Auto Scaling --> EC2|
+-----------------------------+
       |
 IAM Role / SSM
       |
CloudWatch + VPC Flow Logs
       |
    SNS Alerts
```

See [`diagrams/architecture.md`](diagrams/architecture.md) for the Mermaid architecture diagram.

## Core AWS Services

- VPC
- Public / private subnets
- Internet Gateway
- NAT Gateway
- Route tables
- EC2
- Application Load Balancer
- Auto Scaling
- IAM
- Systems Manager concept
- CloudWatch
- VPC Flow Logs
- SNS

## Security Design

### Network Segmentation
The Application Load Balancer is internet-facing while application instances are deployed in private subnets.

### Security Groups
The application security group accepts application traffic **only from the ALB security group**.

### Administrative Access
The base design avoids inbound SSH and uses the Systems Manager access model.

### IAM
Instances use IAM roles rather than hard-coded AWS credentials.

### Metadata Protection
IMDSv2 is required in the launch template.

### Observability
VPC Flow Logs and CloudWatch alarms provide visibility into infrastructure behaviour.

## Scalability & Availability

- Two Availability Zones
- Application Load Balancer
- Auto Scaling Group
- Health checks
- Target tracking scaling policy
- Replaceable application instances

## Terraform Structure

```text
terraform/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars.example
└── modules/
    ├── network/
    ├── compute/
    └── monitoring/
```

The architecture is split into reusable modules to demonstrate separation of concerns.

## Backup & Recovery

The application tier is designed as replaceable compute. Production data services should use managed backup capabilities and recovery testing.

See [`docs/backup_recovery.md`](docs/backup_recovery.md).

## Logging & Monitoring

The lab includes:

- VPC Flow Logs
- CloudWatch Logs
- ALB 5xx alarm
- EC2 CPU alarm
- SNS alert topic

Production extensions could include:

- AWS CloudTrail
- ALB access logs
- Amazon GuardDuty
- AWS Security Hub
- Centralised log archive
- CloudWatch dashboards
- SIEM integration

## Production Improvements

Before production use I would add or review:

1. ACM certificates and HTTPS-only ingress.
2. WAF for relevant internet-facing applications.
3. EBS encryption and explicit KMS strategy.
4. RDS Multi-AZ / S3 depending on application data needs.
5. AWS Backup and restore tests.
6. CloudTrail and central log retention.
7. GuardDuty / Security Hub where appropriate.
8. Remote Terraform state in encrypted S3 with state locking.
9. CI/CD validation for Terraform.
10. Separate Dev / UAT / Prod accounts or environments.
11. AWS Config / policy guardrails.
12. Cost optimisation and tagging controls.

## Deployment

See [`docs/deployment_guide.md`](docs/deployment_guide.md).

> Cost warning: NAT Gateway and ALB resources can generate AWS charges. This project does not require deployment to understand the architecture or review the Terraform.

## Repository Structure

```text
aws-secure-cloud-architecture/
├── terraform/
├── diagrams/
├── docs/
├── scripts/
├── screenshots/
├── .gitignore
└── README.md
```

## Threat Model

See [`docs/threat_model.md`](docs/threat_model.md) for a lightweight mapping of architectural threats to controls.

## Interview Talking Points

Be prepared to explain:

1. Public vs private subnets.
2. Internet Gateway vs NAT Gateway.
3. ALB placement and security groups.
4. Why EC2 should not accept public SSH.
5. IAM roles vs static access keys.
6. IMDSv2.
7. Auto Scaling and ALB health checks.
8. Multi-AZ design.
9. VPC Flow Logs and CloudWatch.
10. Backup / disaster recovery.
11. HTTPS / ACM / WAF production changes.
12. Terraform state security and CI/CD.

## Skills Demonstrated

- AWS architecture
- VPC networking
- IAM
- Cloud security
- Load balancing
- Auto Scaling
- Monitoring
- Logging
- Backup / recovery planning
- Terraform
- Systems engineering
- Security-by-design thinking

## Portfolio Classification

**Type:** Portfolio Build  
**Purpose:** Demonstrate AWS cloud engineering, infrastructure, security and IaC capability.  
**Production data:** None.
