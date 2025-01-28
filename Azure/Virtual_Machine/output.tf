# Output the ID of the first VM in the list (index 0)
output "vm_id" {
  value = azurerm_linux_virtual_machine.web[0].id
}

# ==========================
# Terraform Outputs
# ============

# Output a list of URLs for each web server (VMs) with their public IP addresses
output "url" {
  value = [
    for i, ip in zipmap(range(length(azurerm_linux_virtual_machine.web)), azurerm_linux_virtual_machine.web[*].public_ip_address) :
    format("VM%d: http://%s", i + 1, ip)
  ]
}

# Output SSH command for each web server (VM) using SSH and the private key
output "ssh" {
  value = [
    for i in range(length(azurerm_linux_virtual_machine.web)) :
    format(
      "VM%d: ssh -i %s %s@%s",
      i + 1,               # Increment the VM number for each instance
      var.web_private_key, # Path to the private SSH key for authentication
      var.username,
      azurerm_linux_virtual_machine.web[i].public_ip_address
    )
  ]
}

# Output the URL of the first web server (VM) directly
output "deploy_server" {
  value = "http://${azurerm_linux_virtual_machine.web[0].public_ip_address}"
}
