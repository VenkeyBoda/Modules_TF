output "vm_id" {
  value = azurerm_linux_virtual_machine.web[0].id

}

# ==========================
# Terraform Outputs
# ============

# web server URL output
output "url" {
  value = [
    for i, ip in zipmap(range(length(azurerm_linux_virtual_machine.web)), azurerm_linux_virtual_machine.web[*].public_ip_address) :
    format("VM%d: http://%s", i + 1, ip)
  ]
}

# # SSH Command Output
output "ssh" {
  value = [
    for i in range(length(azurerm_linux_virtual_machine.web)) :
    format(
      "VM%d: ssh -i %s %s@%s",
      i + 1,
      var.web_private_key,
      var.username,
      azurerm_linux_virtual_machine.web[i].public_ip_address
    )
  ]
}

output "deploy_server" {
  value = "http://${azurerm_linux_virtual_machine.web[0].public_ip_address}"

}
