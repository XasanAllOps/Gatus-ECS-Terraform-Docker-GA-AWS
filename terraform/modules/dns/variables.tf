# -- module (root) related variables -- #
variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  type = string
}

# -- normal variables -- #
variable "domain_name" {
  type = string
}

variable "target_health" {
  type = bool
}