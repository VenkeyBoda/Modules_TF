# Create a azure virtual network group
resource "azurerm_virtual_network" "base" {
  name                = var.network_info.name
  address_space       = var.network_info.address_space
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

# Create a azure subnet group
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets_info)
  name                 = var.subnets_info[count.index].name
  address_prefixes     = [var.subnets_info[count.index].address_prefixes]
  virtual_network_name = azurerm_virtual_network.base.name
  resource_group_name  = var.resource_group
}
