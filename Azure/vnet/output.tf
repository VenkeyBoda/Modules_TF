output "vnet_id" {
  value = azurerm_virtual_network.base[*].id
}

output "vnet_name" {
  value       = azurerm_virtual_network.base.name
}