# Output the IDs of all network interfaces
output "nic_id" {
  value       = azurerm_network_interface.nic[*].id
  description = "The IDs of all network interfaces created for the virtual machines"
}

# # Output the IDs of all public IP addresses
# output "pip_id" {
#   value       = azurerm_public_ip.base[*].id
#   description = "The IDs of all public IP addresses associated with the network interfaces"
# }
