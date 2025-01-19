# create a variable group for resourse group
variable "resource_group" {
  type        = string
  description = "name of the resource group"
}

# create a variable group for location
variable "location" {
  type        = string
  description = "location of virtual network"
}

# create a variable group for network security group
variable "nsg_info" {
  type = object({
    name = optional(string, "web-nsg")
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
}

# create a variable group for tags
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}