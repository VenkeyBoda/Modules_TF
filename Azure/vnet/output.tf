output "vnet_id" {
  value = azurerm_virtual_network.base.id

}

output "subnet_id" {
  value = azurerm_subnet.subnets.id
}