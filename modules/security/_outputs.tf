output "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  value       = aws_security_group.alb.id
}

output "ec2_sg_id" {
  description = "アプリケーション（EC2）セキュリティグループのID"
  value       = aws_security_group.ec2.id
}

output "db_sg_id" {
  description = "データベース（RDS）セキュリティグループのID"
  value       = aws_security_group.db.id
}