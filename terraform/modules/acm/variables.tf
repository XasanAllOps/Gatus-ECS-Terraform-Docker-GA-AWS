# -- normal variables -- #
variable "record_name" {
  type = string
}
variable "zone_name" {
  type = string
}

variable "validation_method" {
  type = string
  default = "DNS"
}

variable "environment" {
  type = string
}