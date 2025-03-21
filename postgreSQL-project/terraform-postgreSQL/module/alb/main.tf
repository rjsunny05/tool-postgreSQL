resource "aws_lb" "alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.bastion_sg_id]
  subnets           = var.public_subnet_id
}

resource "aws_lb_target_group" "tg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach" {
  count            = length(var.target_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_ids[count.index]
  port             = 80
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
