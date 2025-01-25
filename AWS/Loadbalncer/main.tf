# Define the AWS Load Balancer
resource "aws_lb" "nlb" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal
  load_balancer_type = var.aws_lb_type
  subnets            = var.subnets_id

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Environment = var.lb_environment
  }
}

# Define the target group for the load balancer
resource "aws_lb_target_group" "nlb_tg" {
  name     = var.aws_lb_name
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id

# Health check configuration for monitoring target health
  health_check {
    healthy_threshold   = var.lb_health_check.healthy_threshold
    unhealthy_threshold = var.lb_health_check.unhealthy_threshold
    timeout             = var.lb_health_check.timeout
    interval            = var.lb_health_check.interval
    protocol            = var.lb_protocol
  }
}

# Attach instances to the target group
resource "aws_lb_target_group_attachment" "test" {
  count            = length(var.target_instance_ids)   # Create an attachment for each target instance ID provided in the variable
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = var.target_instance_ids[count.index]  # Target instance ID from the list of instance IDs provided
  port             = var.lb_port
}

# Define a listener for the load balancer to route traffic
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol
  default_action {
    type             = var.listener_type
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}