# Create a public IP address for each network interface
resource "azurerm_public_ip" "base" {
  count               = var.nic_count
  name                = "${var.pip_address.name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.pip_address.allocation_method
}

# Create a network interface for each virtual machine
resource "azurerm_network_interface" "nic" {
  count               = var.nic_count
  name                = "${var.interface_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group

  # IP configuration for the network interface
  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = var.subnets_id
    private_ip_address_allocation = var.private_ip
    public_ip_address_id          = azurerm_public_ip.base[count.index].id
  }

  # Tags for the network interface
  tags = var.tags
}

# Associate the network interface with a network security group (NSG)
resource "azurerm_network_interface_security_group_association" "nic_to_nsg" {
  count                     = var.nic_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = var.nsg-id
}
