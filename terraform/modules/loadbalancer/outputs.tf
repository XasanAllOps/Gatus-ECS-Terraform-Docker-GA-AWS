output "alb_target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "alb_security_group" {
  value = aws_security_group.alb.id
}