resource "aws_security_group" "eic_sg" {
  name        = "eic-security-group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.ec2_sg_id]
  }
}

resource "aws_ec2_instance_connect_endpoint" "eic" {
  subnet_id          = var.private_subnet_ids[0]  # EICを配置するサブネット
  security_group_ids = [aws_security_group.eic_sg.id]
  preserve_client_ip = true
}

# EC2インスタンス用のIAMロール
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-${var.environment}-ec2-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-role"
  }
}

# EC2インスタンスプロファイル
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-${var.environment}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

# Amazon Linux 2 AMI（リージョンに応じたAMI ID）
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



# 各AZにEC2インスタンスを作成
resource "aws_instance" "app" {
  count                  = length(var.private_subnet_ids)
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.ec2_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  user_data              = var.user_data

  tags = {
    Name = "${var.project_name}-${var.environment}-app-${count.index + 1}"
  }
}

# ALBのターゲットグループ
resource "aws_lb_target_group" "app" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-tg"
  }
}

# ターゲットグループにEC2インスタンスを登録
resource "aws_lb_target_group_attachment" "app" {
  count            = length(aws_instance.app)
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app[count.index].id
  port             = var.app_port
}