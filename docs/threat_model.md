# Lightweight Threat Model

| Threat | Example Risk | Control in Lab / Production Extension |
|---|---|---|
| Direct access to app instances | Internet scanning / exploitation | Private subnets; app SG only trusts ALB |
| Credential exposure | Static AWS keys on hosts | EC2 instance role; no embedded credentials |
| Metadata credential theft | SSRF to instance metadata | IMDSv2 required |
| Lateral visibility loss | Difficult network investigation | VPC Flow Logs |
| Unhealthy or overloaded instances | Availability degradation | ALB health checks + Auto Scaling |
| Unauthorised administration | SSH exposure / shared keys | No inbound SSH; SSM concept |
| Transport interception | HTTP traffic | Production: ACM + HTTPS redirect |
| Data loss | Deleted/corrupt data | Production: managed backups + restore testing |
| Logging gaps | Weak incident investigation | CloudWatch + production CloudTrail/ALB logs |
