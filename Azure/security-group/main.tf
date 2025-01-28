# Create a Network Security Group (NSG) for web servers
resource "azurerm_network_security_group" "web" {
  resource_group_name = var.resource_group
  name                = var.nsg_info.name
  location            = var.location
  tags                = var.tags
}

# Create a Network Security Rule (NSG rule) based on the configuration
resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.nsg_info.security_rules)
  name                        = var.nsg_info.security_rules[count.index].name
  priority                    = var.nsg_info.security_rules[count.index].priority
  direction                   = var.nsg_info.security_rules[count.index].direction
  access                      = var.nsg_info.security_rules[count.index].access
  protocol                    = var.nsg_info.security_rules[count.index].protocol
  source_port_range           = var.nsg_info.security_rules[count.index].source_port_range
  destination_port_range      = var.nsg_info.security_rules[count.index].destination_port_range
  source_address_prefix       = var.nsg_info.security_rules[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_info.security_rules[count.index].destination_address_prefix
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.web.name
}
