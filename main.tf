module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  database_subnets    = var.database_subnets
  project_name        = var.project_name
  environment         = var.environment
}

# Security Module
module "security" {
  source = "./modules/security"

  vpc_id        = module.vpc.vpc_id
  project_name  = var.project_name
  environment   = var.environment
}

# ALB Module
module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  project_name      = var.project_name
  environment       = var.environment
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  app_sg_id           = module.security.app_sg_id
  instance_type       = var.ec2_instance_type
  target_group_arn    = module.alb.target_group_arn
  project_name        = var.project_name
  environment         = var.environment
}

# RDS Module
module "rds" {
  source = "./modules/rds"

  vpc_id              = module.vpc.vpc_id
  database_subnet_ids = module.vpc.database_subnet_ids
  db_sg_id            = module.security.db_sg_id
  instance_class      = var.rds_instance_class
  engine              = var.rds_engine
  engine_version      = var.rds_engine_version
  project_name        = var.project_name
  environment         = var.environment
}