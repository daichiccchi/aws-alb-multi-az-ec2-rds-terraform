output "instance_ids" {
  description = "EC2インスタンスのID"
  value       = aws_instance.app[*].id
}

output "private_ips" {
  description = "EC2インスタンスのプライベートIP"
  value       = aws_instance.app[*].private_ip
}

output "security_group_id" {
  description = "EC2セキュリティグループのID"
  value       = aws_security_group.ec2.id
}

output "target_group_arn" {
  description = "ALBターゲットグループのARN"
  value       = aws_lb_target_group.app.arn
}