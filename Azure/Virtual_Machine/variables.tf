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

# Create a varible group for network_interface_ids
variable "nic_id" {
  type        = list(string)
  description = "the ID of network interface"
}

variable "vm_count" {
  type = number
  
}
variable "virtual_machine_name" {
  type = string
}

variable "username" {
  type = string
}

variable "public_key_path" {
  type = string
  
}
variable "vm_size" {
  type    = string
  default = "Standard_B1s"

}

variable "web_private_key" {
  type = string

}


variable "vm_publisher" {
  type = string

}


variable "offer_image" {
  type = string
}

variable "image_sku" {
  type = string

}

variable "image_version" {
  type = string

}

variable "build_id" {
  type    = number
  default = 1

}

variable "script" {
  type = string

}

variable "vm_zones" {
  type = list(string)
  
}