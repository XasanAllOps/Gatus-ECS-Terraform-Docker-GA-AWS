resource "aws_security_group" "alb" {
  name = var.alb_security_name
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "main" {
  name = "${var.environment}-alb"
  load_balancer_type = "application"
  subnets = var.public_subnets
  security_groups = [aws_security_group.alb.id]
  idle_timeout = 60
}

resource "aws_lb_target_group" "main" {
  name = var.target_group_name
  port = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "redirect"
    
    redirect {
      protocol = "HTTPS"
      port = "443"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port = 443
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}