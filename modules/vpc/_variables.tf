variable "vpc_cidr" {
  description = "VPC用のCIDRブロック"
  type        = string
}

variable "availability_zones" {
  description = "使用するアベイラビリティゾーンのリスト"
  type        = list(string)
}

variable "public_subnets" {
  description = "パブリックサブネット用のCIDRブロック"
  type        = list(string)
}

variable "private_subnets" {
  description = "プライベートサブネット（アプリケーション用）のCIDRブロック"
  type        = list(string)
}

variable "database_subnets" {
  description = "データベース用サブネットのCIDRブロック"
  type        = list(string)
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
}

variable "environment" {
  description = "環境名（dev, staging, prodなど）"
  type        = string
}