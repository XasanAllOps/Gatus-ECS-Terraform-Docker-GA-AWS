#1. Run `cp terraform.tfvars.example terraform.tfvars`
#2. Update your values if needed
#3. If in the future you need to add more sensitive values, add them to this file, it would wise to list this file in .gitignore to avoid accidentally committing sensitive values to version control.

environment            = "dev"
zone_name              = "xasan.site"
record_name            = "xasan.site"
vpc_cidr               = "10.0.0.0/16"
region                 = "eu-west-1"
alb_security_name      = "alb-security"
target_group_name      = "gatus-target-group"
container_insights     = true
task_family_name       = "gatus-task"
retention_in_days      = 5
task_level_cpu         = 256
task_level_memory      = 512
container_level_cpu    = 256
container_level_memory = 512
container_port         = 8080
host_port              = 8080
task_cloudwatch_logs   = "/ecs/gatus_logs"
ecs_service_name       = "gatus-ecs-service"
desired_count          = 2
validation_method      = "DNS"
target_health          = true
