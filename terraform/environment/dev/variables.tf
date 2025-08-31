
variable "environment" {
  type    = string
  default = "stage"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "alb_security_name" {
  type    = string
  default = "alb-security"
}

variable "target_group_name" {
  type    = string
  default = "gatus-target-group"
}

variable "container_image" {
  type = string
}

variable "container_insights" {
  type = bool
  default = true
}

variable "task_family_name" {
  type    = string
  default = "gatus-task"
}

variable "ecs_service_name" {
  type    = string
  default = "gatus-ecs-service"
}

variable "domain_name" {
  type = string
  default = "xasan.site"
}

variable "val_method" {
  type = string
  default = "DNS"
}

variable "target_health" {
  type = bool
  default = true
}
