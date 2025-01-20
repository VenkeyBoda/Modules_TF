# Create a azure subnet group
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets_info)
  name                 = var.subnets_info[count.index].name
  address_prefixes     = [var.subnets_info[count.index].address_prefixes]
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group
}
