# Output the ID of the Network Security Group (NSG) for the web servers
output "nsg_id" {
  value = azurerm_network_security_group.web.id
}
