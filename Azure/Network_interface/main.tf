# create a public ip address
resource "azurerm_public_ip" "base" {
  count               = var.nic_count
  name                = "${var.pip_address.name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.pip_address.allocation_method

}

# ctreate a network interface
resource "azurerm_network_interface" "nic" {
  count               = var.nic_count
  name                = "${var.interface_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = var.subnets_id
    private_ip_address_allocation = var.private_ip
    public_ip_address_id          = azurerm_public_ip.base[count.index].id
  }
  tags = var.tags
}
# create a network interface security group association
resource "azurerm_network_interface_security_group_association" "nic_to_nsg" {
  count                     = var.nic_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = var.nsg-id
}

