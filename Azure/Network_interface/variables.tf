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

# Create a variable group for network interface
variable "nic" {
    type =object({
      name = string
      ip_configuration = object({
        name = string
        private_ip_address_allocation = string

      })
    }) 
}

# create a variable group for subnet id's
variable "subnet_ids" {
    type = string
    description = "subnet id for network interface"  
}

# create a variable group for public ip address id's
variable "pip-id" {
    type = string
    description = "public ip address id for network interface"
  
}

# create a variable group for network security group id's
variable "nsg-id" {
    type = string
    description = "network security group id for newtork interface"
  
}
# create a variable group for tags
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}