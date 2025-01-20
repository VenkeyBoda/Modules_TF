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

# create a variable group for virtual network  
variable "network_info" {
  type = object({
    name          = string
    address_space = list(string)
  })
  description = "Information about the virtual network"
}

# create a variable group for tags
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}