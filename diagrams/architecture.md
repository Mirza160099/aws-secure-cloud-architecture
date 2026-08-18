# Architecture Diagram

```mermaid
flowchart TB
    Internet((Internet))
    R53[Route 53 / DNS]
    IGW[Internet Gateway]
    ALB[Application Load Balancer]
    NAT[NAT Gateway]

    subgraph VPC["VPC 10.20.0.0/16"]
      subgraph Public["Public Subnets - 2 AZs"]
        ALB
        NAT
      end

      subgraph Private["Private Application Subnets - 2 AZs"]
        EC2A[EC2 App Instance]
        EC2B[EC2 App Instance]
        ASG[Auto Scaling Group]
      end
    end

    IAM[IAM Role / Instance Profile]
    SSM[AWS Systems Manager]
    CW[CloudWatch Metrics & Alarms]
    Flow[VPC Flow Logs]
    SNS[SNS Alert Topic]
    Backup[Backup / Recovery Strategy]

    Internet --> R53 --> IGW --> ALB
    ALB --> EC2A
    ALB --> EC2B
    ASG -. manages .-> EC2A
    ASG -. manages .-> EC2B
    Private --> NAT --> IGW
    IAM --> EC2A
    IAM --> EC2B
    SSM -. admin access .-> EC2A
    SSM -. admin access .-> EC2B
    EC2A --> CW
    EC2B --> CW
    Flow --> CW
    CW --> SNS
    EC2A -. replaceable compute .-> Backup
    EC2B -. replaceable compute .-> Backup
```

## Trust Boundaries

- Internet-facing: Route 53 / ALB
- Public network tier: ALB + NAT
- Private workload tier: EC2 Auto Scaling Group
- Management plane: IAM / SSM
- Observability plane: CloudWatch / Flow Logs / SNS
