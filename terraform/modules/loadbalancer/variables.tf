# -- output related variables -- #
variable "vpc_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
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