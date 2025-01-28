# Define the Linux virtual machine resource for the web servers
resource "azurerm_linux_virtual_machine" "web" {
  count                 = var.vm_count
  name                  = "${var.virtual_machine_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [var.nic_id[count.index]]
  size                  = var.vm_size
  admin_username        = var.username

  # SSH Key configuration for VM login
  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key_path)
  }

  # OS disk configuration
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Image source configuration (which OS image to use for the VM)
  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.offer_image
    sku       = var.image_sku
    version   = var.image_version
  }
}

# Define the null resource to execute remote provisioning on the VMs
resource "null_resource" "webnull" {
  count = var.vm_count

  # Trigger for this resource to re-run when the build ID changes
  triggers = {
    build_id = var.build_id
  }

  # SSH connection configuration for the remote execution
  connection {
    host        = azurerm_linux_virtual_machine.web[count.index].public_ip_address
    type        = "ssh"
    user        = var.username
    private_key = file(var.web_private_key)
  }

  # Remote execution script to be run on the VMs (like installation scripts)
  provisioner "remote-exec" {
    script = var.script
  }
}
