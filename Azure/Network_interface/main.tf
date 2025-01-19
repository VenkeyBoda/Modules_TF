# ctreate a network interface
resource "azurerm_network_interface" "web" {
  name                = var.nic.name
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = var.nic.ip_configuration.name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = var.pip-id
  }
  tags = var.tags
}

# create a network interface security group association
resource "azurerm_network_interface_security_group_association" "nsg_to_nic" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = var.nsg-id

}