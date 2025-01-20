output "subnets_id" {
  value = azurerm_subnet.subnets[*].id
}