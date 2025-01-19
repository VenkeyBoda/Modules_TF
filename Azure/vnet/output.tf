output "vnet_id" {
  value = azurerm_virtual_network.base.id

}

# output "subnets_id" {
#   value = azurerm_subnet.subnets.id
# }

# output "subnets_id" {
#   value = [for subnet in azurerm_subnet.subnets : subnets.id]
# }

output "subnets_id" {
  value = azurerm_subnet.subnets.id
}