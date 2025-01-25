# create a vm with a network interface associated with nsg and public ip
resource "azurerm_linux_virtual_machine" "web" {
  count                 = var.vm_count
  name                  = "${var.virtual_machine_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [var.nic_id[count.index]]
  size                  = var.vm_size
  admin_username        = var.username
  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key_path)

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }
  zone = element(var.vm_zones, count.index % length(var.vm_zones))
  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.offer_image
    sku       = var.image_sku
    version   = var.image_version

  }
}

resource "null_resource" "webnull" {
  count = var.vm_count
  triggers = {
    build_id = var.build_id
  }


  connection {
    host        = azurerm_linux_virtual_machine.web[count.index].public_ip_address
    type        = "ssh"
    user        = var.username
    private_key = file(var.web_private_key)
  }

  provisioner "remote-exec" {
    script = var.script

  }
}
