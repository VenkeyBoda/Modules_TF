# Variable group for resource group
variable "resource_group" {
  type        = string
  description = "name of the resource group"
}

# Variable group for location
variable "location" {
  type        = string
  description = "location of virtual network"
}

# Variable group for network security group (NSG) information
variable "nsg_info" {
  type = object({
    name = optional(string, "web-nsg")

    # A list of security rules for the NSG
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = optional(string, "Inbound")
      access                     = optional(string, "Deny")
      protocol                   = optional(string, "Tcp")
      source_port_range          = optional(string, "*")
      destination_port_range     = optional(string, "*")
      source_address_prefix      = optional(string, "*")
      destination_address_prefix = optional(string, "*")
    }))
  })
  description = "Contains the configuration for the network security group and its rules"
}

# Variable group for tags (used for tagging resources)
variable "tags" {
  type = map(string)
  default = {
    Env = "qa"
  }
  description = "A map of tags to assign to resources"
}
