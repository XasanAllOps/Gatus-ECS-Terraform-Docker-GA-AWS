variable "environment" {
  type = string
}

variable "exec_policy_arn" {
  type = string
  default = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}