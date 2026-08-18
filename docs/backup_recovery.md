# Backup & Recovery Strategy

This portfolio architecture separates **stateless application compute** from durable data.

## EC2 / Application Layer
Application instances are treated as replaceable resources managed by an Auto Scaling Group. Recovery is based on:
- Launch templates
- Auto Scaling replacement
- Infrastructure as Code
- Version-controlled application/bootstrap configuration

## Data Layer
A production extension should use managed durable services such as:
- Amazon RDS with automated backups / Multi-AZ where appropriate
- S3 versioning and lifecycle policies
- AWS Backup for supported workloads
- Cross-region replication only where business requirements justify it

## Recovery Objectives
RPO and RTO must be set from business impact analysis rather than chosen arbitrarily.

## Recovery Testing
A production implementation should include:
1. Scheduled restore tests
2. Backup success monitoring
3. Recovery runbooks
4. IaC redeployment testing
5. Dependency validation
6. Evidence retained for audit / resilience review
