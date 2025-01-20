# ctreate a network interface
resource "azurerm_network_interface" "web" {
  name                = "web-nic"
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = "web"
    subnet_id                     = var.subnets_id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.pip-id
  }
}
# create a network interface security group association
resource "azurerm_network_interface_security_group_association" "nsg_to_nic" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = var.nsg-id
}