# Create a azure virtual network group
resource "azurerm_virtual_network" "base" {
  name                = var.network_info.name
  address_space       = var.network_info.address_space
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}
