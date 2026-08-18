provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-secure-cloud-architecture"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Portfolio   = "Mirza-Saif-Baig"
    }
  }
}
