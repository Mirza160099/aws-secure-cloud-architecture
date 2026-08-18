# Security Design Decisions

## Network Segmentation
- Application Load Balancer is placed in public subnets.
- EC2 application instances are placed in private subnets.
- Application instances do not require inbound SSH.
- AWS Systems Manager is used conceptually for administrative access.

## Security Groups
- ALB security group accepts demo HTTP traffic.
- Application security group only permits port 8080 from the ALB security group.
- In production, the public listener should use HTTPS with ACM and HTTP should redirect to HTTPS.

## IAM
- EC2 uses an instance role rather than embedded credentials.
- Only the AWS managed SSM core policy is attached in the base lab.
- Additional workload permissions should be narrowly scoped.

## Instance Metadata
IMDSv2 is required through the launch template.

## Logging
- VPC Flow Logs are enabled to CloudWatch Logs.
- CloudWatch alarms demonstrate infrastructure monitoring.
- Production extensions should add CloudTrail, ALB access logs, GuardDuty, Security Hub and central log retention based on requirements.

## Encryption
A production implementation should enforce:
- EBS encryption
- S3 encryption / public access controls
- RDS encryption
- TLS in transit
- KMS key strategy where required

## Important Lab Limitation
The repository is an architecture/IaC portfolio demonstration. It should be reviewed, tested and adapted before production use.
