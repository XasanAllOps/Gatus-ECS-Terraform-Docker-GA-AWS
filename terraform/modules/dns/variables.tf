# -- module (root) related variables -- #
variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  type = string
}

# -- normal variables -- #
variable "zone_name" {
  type = string
}
variable "record_name" {
  type = string
}

variable "target_health" {
  type = bool
}