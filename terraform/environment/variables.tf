
variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string 
}

variable "azs" {
  type = list(string)
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "alb_security_name" {
  type = string 
}

variable "target_group_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "ecs_service_name" {
  type = string
}
