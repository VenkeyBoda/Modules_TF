# Name of the AWS Load Balancer
variable "aws_lb_name" {
  type = string

}

# Indicates whether the Load Balancer is internal (true) or external (false)
variable "aws_lb_internal" {
  type    = bool
  default = false

}

# Type of Load Balancer (e.g., application, network)
variable "aws_lb_type" {
  type = string

}

# List of subnet IDs where the Load Balancer will be deployed
variable "subnets_id" {
    type = list(string)
  
}

# Enables or disables deletion protection for the Load Balancer
variable "enable_deletion_protection" {
  type    = bool
  default = false

}

# Environment designation for the Load Balancer (e.g., production, staging)
variable "lb_environment" {
  type = string

}

# Port on which the Load Balancer will listen for traffic
variable "lb_port" {
    type = number
  
}

# Protocol used by the Load Balancer (e.g., HTTP, HTTPS, TCP)
variable "lb_protocol" {
  type = string

}

# Health check configuration for the Load Balancer
variable "lb_health_check" {
  type = map(string)
  default = {
    healthy_threshold   = 2 # Number of consecutive successful health checks required to consider an instance healthy
    unhealthy_threshold = 2 # Number of consecutive failed health checks required to consider an instance unhealthy
    timeout             = 5 # Time in seconds to wait before considering a health check failed
    interval            = 6 # Time in seconds between health checks
  }
}

# List of target instance IDs that the Load Balancer will route traffic to
variable "target_instance_ids" {
    type = list(string)
  
}

# Type of listener for the Load Balancer (default is 'forward')
variable "listener_type" {
    type = string
    default = "forward"
  
}

# VPC ID where the Load Balancer will be created
variable "vpc_id" {
    type = string
  
}
