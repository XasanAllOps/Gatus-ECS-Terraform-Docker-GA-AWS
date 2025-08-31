# -- output related variables -- #
variable "vpc_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}

variable "certificate_arn" {
  type = string
}

# -- normal variables -- #
variable "alb_security_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "target_group_name" {
  type = string
}