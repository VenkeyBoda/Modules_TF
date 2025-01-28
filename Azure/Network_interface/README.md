# Azure Network Interface and Public IP Module

This module creates Azure Network Interfaces (NICs) and associates them with Public IP addresses, subnets, and Network Security Groups (NSGs). It also outputs the IDs of the created resources for further use.

## Features
- Creates Public IP addresses for each network interface.
- Configures network interfaces with private and public IP addresses.
- Associates network interfaces with NSGs.
- Allows for tagging of all resources.

## Usage

```hcl
module "network_interfaces" {
  source = "./path_to_module"

  resource_group  = "my-resource-group"
  location        = "East US"
  nic_count       = 2
  interface_name  = "my-nic"
  subnets_id      = "subnet-resource-id"
  private_ip      = "Dynamic"
  nsg-id          = "nsg-resource-id"

  pip_address = {
    name              = "my-public-ip"
    allocation_method = "Static"
  }

  tags = {
    Env = "prod"
  }
}
```

## Inputs

| Name             | Type          | Description                                                   | Default      | Required |
|------------------|---------------|---------------------------------------------------------------|--------------|----------|
| `resource_group` | `string`      | Name of the resource group where the resources will be created. | -            | Yes      |
| `location`       | `string`      | The Azure region where resources like virtual network and VM will be deployed. | - | Yes |
| `pip_address`    | `object`      | Details for Public IP address configuration.                  | -            | Yes      |
| `pip_address.name` | `string`    | Name of the Public IP addresses.                             | -            | Yes      |
| `pip_address.allocation_method` | `string` | Allocation method for Public IP addresses (e.g., `Static`, `Dynamic`). | - | Yes |
| `interface_name` | `string`      | Prefix for network interface names.                           | -            | Yes      |
| `subnets_id`     | `string`      | The subnet ID for the network interfaces.                     | -            | Yes      |
| `private_ip`     | `string`      | Private IP address allocation method (e.g., `Dynamic`, `Static`). | - | Yes |
| `nsg-id`         | `string`      | The NSG ID for the network interfaces.                        | -            | Yes      |
| `nic_count`      | `number`      | Number of network interfaces to create.                       | -            | Yes      |
| `tags`           | `map(string)` | Tags to be applied to resources (e.g., for categorization).   | `{Env = "dev"}` | No       |

## Outputs

| Name      | Type          | Description                                          |
|-----------|---------------|------------------------------------------------------|
| `nic_id`  | `list(string)`| The IDs of all network interfaces created.           |
| `pip_id`  | `list(string)`| The IDs of all Public IP addresses created.          |

## Notes
- Ensure the provided subnet and NSG IDs exist in the target Azure resource group.
- Customize the `tags` variable to suit your organization's tagging policy.
- This module can be reused by adjusting the input variables according to your deployment needs.

## Example Output

After applying this module, you can retrieve the network interface and public IP IDs:

```hcl
output "nic_ids" {
  value = module.network_interfaces.nic_id
}

output "pip_ids" {
  value = module.network_interfaces.pip_id
}
```

