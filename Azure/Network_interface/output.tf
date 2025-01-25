output "nic_id" {
  value = azurerm_network_interface.nic[*].id
}

output "pip_id" {
  value = azurerm_public_ip.base[*].id
  
}