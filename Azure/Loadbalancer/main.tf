# Declare a Public IP resource for the Load Balancer
# This will allocate a static public IP for the load balancer to use
resource "azurerm_public_ip" "lb_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static" # or "Dynamic" depending on your needs
}

# Create an Azure Load Balancer resource
# This load balancer will use the public IP for its frontend configuration
resource "azurerm_lb" "my_lb" {
  name                = var.lb_name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Standard"

  # Configure the frontend IP of the load balancer using the public IP
  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

# Create a Backend Address Pool for the Load Balancer
# This pool will hold the backend VM instances that the load balancer will distribute traffic to
resource "azurerm_lb_backend_address_pool" "my_lb_pool" {
  loadbalancer_id = azurerm_lb.my_lb.id
  name            = var.lb_backend_name
}

# Associate Network Interfaces to the Backend Pool of the Load Balancer
# Each NIC will be added to the load balancer's backend pool to receive traffic
resource "azurerm_network_interface_backend_address_pool_association" "my_nic_lb_pool" {
  count                   = var.nic_count
  network_interface_id    = var.nic_id[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.my_lb_pool.id
  ip_configuration_name   = "ipconfig-${count.index}"
}

# Create a Load Balancer Probe for Health Check
# This probe checks the health of backend instances on port 80 (HTTP)
resource "azurerm_lb_probe" "lb_probe" {
  name            = var.lb_probe_name
  loadbalancer_id = azurerm_lb.my_lb.id
  port            = 80
}

# Create a Load Balancer Rule for Traffic Distribution
# This rule defines the traffic distribution from the frontend IP to the backend pool on port 80
resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.my_lb.id
  frontend_ip_configuration_name = var.frontend_ip_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  disable_outbound_snat          = true
  probe_id                       = azurerm_lb_probe.lb_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.my_lb_pool.id]
}
