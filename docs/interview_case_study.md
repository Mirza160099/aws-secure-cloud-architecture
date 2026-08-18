# Interview Case Study

## Situation
A web workload needs to be deployed on AWS with better availability and security than a single internet-facing EC2 instance.

## Task
Design a portfolio architecture that demonstrates segmentation, least privilege, horizontal scaling, health checks, logging and recovery thinking.

## Action
- Built a VPC across two Availability Zones.
- Separated public load-balancing/NAT components from private application compute.
- Restricted application inbound access to the ALB security group.
- Used an EC2 instance role and Systems Manager concept instead of embedded keys or inbound SSH.
- Added an Application Load Balancer and Auto Scaling Group.
- Added VPC Flow Logs, CloudWatch alarms and an SNS alert topic.
- Documented backup/recovery, threat model and production security improvements.
- Implemented the design using modular Terraform.

## Result
Created a reproducible AWS infrastructure portfolio project that demonstrates cloud architecture, security controls, operational monitoring and infrastructure-as-code principles.

## Interview Talking Points
1. Why put EC2 instances in private subnets?
2. Why is a NAT Gateway different from an Internet Gateway?
3. Security group vs NACL.
4. ALB vs NLB.
5. Why use an IAM role instead of access keys?
6. Why disable inbound SSH and use SSM?
7. How Auto Scaling improves resilience.
8. How to design for multi-AZ failure.
9. What should be logged for incident response?
10. How RPO/RTO influence backup architecture.
11. What you would change for production HTTPS.
12. How Terraform state should be secured in a team environment.
