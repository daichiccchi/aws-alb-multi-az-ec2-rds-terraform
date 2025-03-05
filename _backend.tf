terraform {
  backend "s3" {
    bucket         = "daichiccchi-terraform-state-bucket"  # S3バケット名
    key            = "aws-alb-multi-az-ec2-rds-terraform/terraform.tfstate"
    region         = "ap-northeast-1"             # リージョン
    encrypt        = true
    dynamodb_table = "daichiccchi-terraform-locks"            # 省略可能: ステートロック用のDynamoDBテーブル
  }
}