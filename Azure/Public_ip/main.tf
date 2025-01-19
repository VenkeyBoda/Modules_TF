# create a public ip address
resource "azurerm_public_ip" "base" {
  name                = var.pip_address.name
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.pip_address.allocation_method
  tags =  var.tags
}