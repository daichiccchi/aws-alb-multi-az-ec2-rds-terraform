output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "パブリックサブネットIDのリスト"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "プライベートサブネット（EC2用）IDのリスト"
  value       = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  description = "データベース用サブネットIDのリスト"
  value       = aws_subnet.database[*].id
}

output "nat_gateway_ids" {
  description = "NATゲートウェイIDのリスト"
  value       = aws_nat_gateway.nat[*].id
}

output "db_subnet_group_name" {
  description = "データベースサブネットグループの名前"
  value       = aws_db_subnet_group.main.name
}

output "availability_zones" {
  description = "使用されているアベイラビリティゾーンのリスト"
  value       = var.availability_zones
}