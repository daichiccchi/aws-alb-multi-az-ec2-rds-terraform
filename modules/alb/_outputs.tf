output "alb_id" {
  description = "Application Load BalancerのID"
  value       = aws_lb.main.id
}

output "alb_arn" {
  description = "Application Load BalancerのARN"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "Application Load BalancerのDNS名"
  value       = aws_lb.main.dns_name
}

output "http_listener_arn" {
  description = "HTTPリスナーのARN"
  value       = aws_lb_listener.http.arn
}

output "https_listener_arn" {
  description = "HTTPSリスナーのARN"
  value       = var.ssl_certificate_arn != "" ? aws_lb_listener.https[0].arn : null
}