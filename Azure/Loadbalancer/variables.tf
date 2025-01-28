# Variable for Resource Group name
variable "resource_group" {
  type        = string
  description = "The name of the resource group where the resources will be created"
}

# Variable for Location (Region) where resources will be deployed
variable "location" {
  type        = string
  description = "The location (region) of the load balancer and other resources"
}

# Variable for Load Balancer Name
variable "lb_name" {
  type        = string
  description = "The name of the load balancer"
}

# Variable for Frontend IP Name
variable "frontend_ip_name" {
  type        = string
  description = "The name of the frontend IP configuration for the load balancer"
}

# Variable for Load Balancer Backend Pool Name
variable "lb_backend_name" {
  type        = string
  description = "The name of the backend pool for the load balancer"
}

# Variable for the number of network interfaces
variable "nic_count" {
  type        = number
  description = "The number of network interfaces that should be associated with the load balancer"
}

# Variable for Network Interface IDs (list of interface IDs)
variable "nic_id" {
  type        = list(string)
  description = "A list of network interface IDs to be associated with the load balancer"
}

# Variable for Load Balancer Probe Name
variable "lb_probe_name" {
  type        = string
  description = "The name of the health probe for the load balancer"
}

# Variable for Load Balancer Rule Name
variable "lb_rule_name" {
  type        = string
  description = "The name of the load balancing rule to define traffic routing"
}
