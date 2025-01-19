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

# create a variable group for public ip address
variable "pip_address" {
    type = object({
      name = string
      allocation_method = string 
    })
}

# create a variable group for tags
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}