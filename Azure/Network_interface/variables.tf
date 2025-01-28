# Variable for Resource Group name
variable "resource_group" {
  type        = string
  description = "Name of the resource group where the resources will be created"
}

# Variable for Location (Region) of the resources
variable "location" {
  type        = string
  description = "The Azure region where resources like virtual network and VM will be deployed"
}

# Variable for Public IP address details
variable "pip_address" {
  type = object({
    name              = string
    allocation_method = string
  })
}

# Variable for network interface name
variable "interface_name" {
  type = string
}

# Variable for subnet IDs (used for associating network interfaces)
variable "subnets_id" {
  type        = string
  description = "The subnet ID for the network interfaces"
}

# Variable for Private IP address configuration
variable "private_ip" {
  type = string
}

# Variable for Network Security Group (NSG) ID
variable "nsg-id" {
  type        = string
  description = "The NSG ID for the network interfaces"
}

# Variable for the number of network interfaces to create
variable "nic_count" {
  type = number
}

# Variable for tags to be applied to resources (e.g., for categorization)
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}
