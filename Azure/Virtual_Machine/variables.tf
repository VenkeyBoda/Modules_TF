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
    type = string
    description = "the ID of network interface"
}

# create a variable group for web server information
variable "web_server_info" {
  type = object({
    name             = string
    size             = string
    admin_username   = string
    public_key_path  = string
    private_key_path = string
  })
}

# # Create a variable group for source image
# variable "image_reference" {
#   type = object({
#     publisher = string
#     offer = string
#     sku = string
#     version = string
#   })
  
# }