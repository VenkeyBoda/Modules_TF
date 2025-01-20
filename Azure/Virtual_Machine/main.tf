# create a vm with a network interface associated with nsg and public ip
resource "azurerm_linux_virtual_machine" "web" {
  name                  = var.web_server_info.name
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [var.nic_id]
  size                  = var.web_server_info.size
  admin_username        = var.web_server_info.admin_username
  admin_ssh_key {
    username   = var.web_server_info.admin_username
    public_key = file(var.web_server_info.public_key_path)

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

  }
    connection {
    host        = azurerm_linux_virtual_machine.web.public_ip_address
    type        = "ssh"
    user        = var.web_server_info.admin_username
    private_key = file(var.web_server_info.private_key_path)
  }

}