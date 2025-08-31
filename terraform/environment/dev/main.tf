module "vpc" {
  source = "../../modules/network"

  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  azs                 = var.azs
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "alb" {
  source = "../../modules/loadbalancer"

  environment       = var.environment
  alb_security_name = var.alb_security_name
  target_group_name = var.target_group_name
  # -- outputs -- #
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  certificate_arn = module.acm.certificate_arn
  depends_on     = [module.vpc]
}

module "acm" {
  source = "../../modules/acm"

  environment = var.environment
  domain_name = var.domain_name
  val_method = var.val_method
}

module "dns" {
  source = "../../modules/dns"

  domain_name = var.domain_name
  target_health = var.target_health
  # -- outputs -- #
  alb_zone_id = module.alb.alb_zone_id
  alb_dns_name = module.alb.alb_dns_name
}

module "iam" {
  source = "../../modules/iam"
  
  environment = var.environment
}

module "ecs" {
  source = "../../modules/ecs"

  environment        = var.environment
  container_insights = true
  container_image    = var.container_image
  ecs_service_name   = var.ecs_service_name
  task_family_name   = var.task_family_name
  # -- outputs -- #
  region                 = var.region
  vpc_id                 = module.vpc.vpc_id
  private_subnets        = module.vpc.private_subnets
  target_group_alb_arn   = module.alb.alb_target_group_arn
  alb_security_group     = module.alb.alb_security_group
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  ecs_task_role_arn      = module.iam.ecs_task_role_arn
  depends_on             = [module.alb]
}
