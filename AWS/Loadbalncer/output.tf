# Output the URL of the load balancer for easy access
output "url" {
    value = "http://${aws_lb.nlb.dns_name}"
  
}