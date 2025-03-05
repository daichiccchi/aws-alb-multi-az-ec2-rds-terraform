variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "app_port" {
  description = "アプリケーションが実行されるポート"
  type        = number
  default     = 80
}

variable "db_port" {
  description = "データベースが使用するポート"
  type        = number
  default     = 3306  # MySQLのデフォルトポート
}

variable "ssh_allowed_cidr_blocks" {
  description = "SSHアクセスを許可するCIDRブロックのリスト"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # 本番環境では制限することをお勧めします
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
}

variable "environment" {
  description = "環境名（例: dev, staging, prod）"
  type        = string
}