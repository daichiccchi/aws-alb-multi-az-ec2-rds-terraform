output "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  value       = aws_security_group.alb.id
}

output "app_sg_id" {
  description = "アプリケーション（EC2）セキュリティグループのID"
  value       = aws_security_group.app.id
}

output "db_sg_id" {
  description = "データベース（RDS）セキュリティグループのID"
  value       = aws_security_group.db.id
}