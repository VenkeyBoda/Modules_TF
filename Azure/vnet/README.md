
# Azure Virtual Network and Subnet Module

This Terraform module provisions an Azure Virtual Network (VNet) and multiple subnets in a specified resource group. It is designed to create a VNet along with its subnets, using configurable variables for flexibility.

## Requirements

- Terraform 0.12 or higher
- Azure provider (`azurerm`)

## Usage

To use this module, include it in your Terraform configuration:

```hcl
module "vnet" {
  source             = "path_to_your_module"
  resource_group     = "my-resource-group"
  location           = "East US"
  network_info = {
    name          = "myVnet"
    address_space = ["10.0.0.0/16"]
  }
  subnets_info = [
    {
      name             = "subnet1"
      address_prefixes = "10.0.1.0/24"
    },
    {
      name             = "subnet2"
      address_prefixes = "10.0.2.0/24"
    }
  ]
  tags = {
    Env = "prod"
  }
}
```

## Inputs

| Variable              | Description                                                       | Type                                                                                              | Default Value                               |
| --------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| `resource_group`      | Name of the Azure Resource Group where the VNet will be created.   | `string`                                                                                           | N/A (Required)                              |
| `location`            | Location for the Virtual Network.                                 | `string`                                                                                           | N/A (Required)                              |
| `network_info`        | Information about the Virtual Network, including its name and address space. | `object({name = string, address_space = list(string)})`                                            | N/A (Required)                              |
| `subnets_info`        | A list of objects containing subnet names and address prefixes.   | `list(object({name = string, address_prefixes = string}))`                                          | N/A (Required)                              |
| `tags`                | A map of tags to apply to the resources.                           | `map(string)`                                                                                     | `{ Env = "dev" }`                           |

## Outputs

| Output Name   | Description                                                 | Type                    |
| ------------- | ----------------------------------------------------------- | ----------------------- |
| `vnet_id`     | The ID of the Virtual Network.                              | `list(string)`          |
| `subnets_id`  | The IDs of all created subnets.                             | `list(string)`          |

## Example

Here is a basic example using the module:

```hcl
module "vnet" {
  source             = "path_to_your_module"
  resource_group     = "my-resource-group"
  location           = "East US"
  network_info = {
    name          = "myVnet"
    address_space = ["10.0.0.0/16"]
  }
  subnets_info = [
    {
      name             = "subnet1"
      address_prefixes = "10.0.1.0/24"
    },
    {
      name             = "subnet2"
      address_prefixes = "10.0.2.0/24"
    }
  ]
  tags = {
    Env = "prod"
  }
}
```

## Author

This module was created by [Your Name] ([Your GitHub/Profile Link]).