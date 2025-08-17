# --- output related variables --- #
variable "alb_security_group" {
  type = string
}

variable "target_group_alb_arn" {
  type = string
}

variable "ecs_execution_role_arn" {
  type = string
}

variable "ecs_task_role_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet" {
  type = list(string)
}

# --- normal variables --- #
variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "container_insights" {
  type = bool
}

variable "ecs_service_name" {
  type = string
}

variable "task_family_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_name" {
  type    = string
  default = "gatus_app"
}

