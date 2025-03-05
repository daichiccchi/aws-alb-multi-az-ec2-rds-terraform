variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "private_subnet_ids" {
  description = "プライベートサブネットIDのリスト"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  type        = string
}

variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
  default     = "t2.micro"
}

variable "app_port" {
  description = "アプリケーションが実行されるポート"
  type        = number
  default     = 80
}

variable "ssh_allowed_cidr_blocks" {
  description = "インスタンスへのSSHを許可するCIDRブロックのリスト"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
}

variable "user_data" {
  description = "EC2起動時の設定"
  type        = string
}

variable "environment" {
  description = "環境名（dev, staging, prodなど）"
  type        = string
}