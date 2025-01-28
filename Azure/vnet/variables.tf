# Variable for specifying the name of the Resource Group
variable "resource_group" {
  type        = string
  description = "name of the resource group"
}

# Variable for specifying the location (Azure region) where resources will be created
variable "location" {
  type        = string
  description = "location of virtual network"
}

# Variable for specifying details about the virtual network (VNet)
variable "network_info" {
  type = object({
    name          = string
    address_space = list(string)
  })
  description = "Information about the virtual network"
}

# Variable for specifying a list of subnets and their CIDR blocks within the VNet
variable "subnets_info" {
  type = list(object({
    name             = string
    address_prefixes = string
  }))
  description = "A list of objects containing subnet information"
}

# Variable for specifying tags to categorize and manage resources
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}
