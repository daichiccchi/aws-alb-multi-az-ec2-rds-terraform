variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "public_subnet_ids" {
  description = "パブリックサブネットIDのリスト"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  type        = string
}

variable "target_group_arn" {
  description = "リクエストを転送するターゲットグループのARN"
  type        = string
}

variable "ssl_certificate_arn" {
  description = "HTTPSリスナー用のSSL証明書ARN"
  type        = string
  default     = ""
}

variable "enable_deletion_protection" {
  description = "ALBの削除保護を有効にするかどうか"
  type        = bool
  default     = false
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
}

variable "environment" {
  description = "環境名（dev, staging, prodなど）"
  type        = string
}