# ユーザーデータスクリプト
locals {
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello from ${var.project_name}-${var.environment} instance"
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Welcome to ${var.project_name} - ${var.environment}</h1><p>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>" > /var/www/html/index.html
    EOF
}