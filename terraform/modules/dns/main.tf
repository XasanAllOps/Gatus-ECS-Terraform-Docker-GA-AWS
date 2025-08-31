data "aws_route53_zone" "main" {
  name = "xasan.site"
}

resource "aws_route53_record" "alb_name" {
  zone_id = data.aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"
  ttl = 300

  alias {
    name = var.alb_dns_name
    zone_id = var.alb_zone_id
    evaluate_target_health = var.target_health
  }
}