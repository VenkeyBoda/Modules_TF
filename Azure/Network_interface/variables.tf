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
    name              = string
    allocation_method = string
  })
}


variable "interface_name" {
  type = string

}

# variable "ip_configuration_name" {
#   type = string

# }
# create a variable group for subnet id's
variable "subnets_id" {
  type        = string
  description = "subnet id for network interface"
}

variable "private_ip" {
  type = string

}

# create a variable group for network security group id's
variable "nsg-id" {
  type        = string
  description = "network security group id for newtork interface"

}

variable "nic_count" {
  type = number

}
# create a variable group for tags
variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}
