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

# Create a variable group for subnets
variable "subnets_info" {
  type = list(object({
    name   = string
    address_prefixes = string
  }))
  description = "A list of objects containing subnet information"
}

variable "vnet_name" {
  description = "The ID of the virtual network"
  type        = string
}