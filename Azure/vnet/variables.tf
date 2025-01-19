variable "resource_group" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of virtual network"
}

variable "network_info" {
  type = object({
    address_space = optional(list(string), ["10.0.0.0/16"])
    subnets       = map(string)
    name          = string
  })
  description = "network information"
}

variable "tags" {
  type = map(string)
  default = {
    Env = "dev"
  }
}