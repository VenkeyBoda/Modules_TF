# Output the public IP address of the load balancer
# This will provide the URL for accessing the load balancer via HTTP
output "public_ip_address" {
  value = "http://${azurerm_public_lb_ip[0].ip_address}"
}