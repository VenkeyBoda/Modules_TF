# Variable for Resource Group name
variable "resource_group" {
  type        = string
  description = "The name of the resource group where the resources will be created"
}

# Variable for Location (Region) where resources will be deployed
variable "location" {
  type        = string
  description = "The location (region) of the virtual network and other resources"
}

# Variable for Network Interface IDs (list of interface IDs)
variable "nic_id" {
  type        = list(string)
  description = "A list of network interface IDs to be associated with the virtual machines"
}

# Variable for number of virtual machines to create
variable "vm_count" {
  type        = number
  description = "The number of virtual machines to create"
}

# Variable for the base name of the virtual machines
variable "virtual_machine_name" {
  type        = string
  description = "The base name for the virtual machines"
}

# Variable for the username to access the virtual machines
variable "username" {
  type        = string
  description = "The admin username for the virtual machines"
}

# Variable for the path to the public SSH key used for authentication
variable "public_key_path" {
  type        = string
  description = "Path to the public SSH key for authentication"
}

# Variable for the size of the virtual machines
variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "The size of the virtual machines (default is Standard_B1s)"
}

# Variable for the private SSH key used for VM access
variable "web_private_key" {
  type        = string
  description = "Path to the private SSH key for accessing the web servers"
}

# Variable for the publisher of the VM image
variable "vm_publisher" {
  type        = string
  description = "The publisher of the VM image (e.g., Canonical for Ubuntu)"
}

# Variable for the offer name of the VM image (e.g., Ubuntu Server)
variable "offer_image" {
  type        = string
  description = "The offer name of the VM image"
}

# Variable for the SKU (version) of the VM image (e.g., '18.04-LTS' for Ubuntu)
variable "image_sku" {
  type        = string
  description = "The SKU/version of the VM image"
}

# Variable for the version of the VM image (e.g., 'latest')
variable "image_version" {
  type        = string
  description = "The version of the VM image"
}

# Variable for the build ID, useful for triggering re-deployments
variable "build_id" {
  type        = string
  default     = "1"
  description = "The build ID used for triggering re-deployments"
}

# Variable for the script to execute on the VM (for provisioning)
variable "script" {
  type        = string
  description = "The path to the script that will be executed on the VM (for provisioning)"
}
