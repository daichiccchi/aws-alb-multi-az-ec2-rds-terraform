terraform {
  backend "s3" {
    bucket         = "daichiccchi-terraform-state-bucket"  # S3バケット名
    key            = "aws-alb-multi-az-ec2-rds-terraform/terraform.tfstate"
    region         = "ap-northeast-1"             # リージョン
    encrypt        = true
    use_lockfile   = true
    # dynamodb_table = "daichiccchi-terraform-locks"       
  }
}