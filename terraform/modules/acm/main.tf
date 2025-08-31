resource "aws_acm_certificate" "main" {
  domain_name = var.domain_name
  validation_method = var.val_method

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Environment = var.environment
  }
}

data "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "cert_val" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = data.aws_route53_zone.main.zone_id
  name = each.value.name
  type = each.value.type
  ttl = 60
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_val : record.fqdn]
}