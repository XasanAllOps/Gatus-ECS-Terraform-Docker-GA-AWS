data "aws_route53_zone" "main" {
  name = var.zone_name
}

resource "aws_route53_record" "alb_alias_record" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = var.target_health
  }
}