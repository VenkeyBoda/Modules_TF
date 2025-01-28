# Output the ID(s) of the virtual network(s) created
output "vnet_id" {
  value = azurerm_virtual_network.base[*].id
}

# Output the ID(s) of the subnets created within the virtual network
output "subnets_id" {
  value = azurerm_subnet.subnets[*].id
}
