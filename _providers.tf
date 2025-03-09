provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "aws-alb-multi-az-ec2-rds-terraform"
      ManagedBy   = "Terraform"
    }
  }
}