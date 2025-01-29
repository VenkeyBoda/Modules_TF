# Output the IDs of all network interfaces
output "nic_id" {
  value       = azurerm_network_interface.nic[*].id
  description = "The IDs of all network interfaces created for the virtual machines"
}

