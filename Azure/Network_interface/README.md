# README.md for Azure Public IP and Network Interface Module

## Overview

This Terraform module creates a public IP address for each network interface associated with virtual machines in Azure. It allows for dynamic scaling of network interfaces and public IP addresses based on user-defined input parameters.

## Features

- **Dynamic Creation**: Create multiple public IPs and network interfaces based on the specified count.
- **Security Group Association**: Automatically associates each network interface with a specified Network Security Group (NSG).
- **Outputs**: Provides outputs for easy reference to created resources.

## Inputs

The following variables can be defined in your Terraform configuration to customize the module:

| Variable Name           | Type                | Description                                                                 |
|-------------------------|---------------------|-----------------------------------------------------------------------------|
| `resource_group`        | `string`            | Name of the resource group where the resources will be created.            |
| `location`              | `string`            | The Azure region where resources will be deployed.                         |
| `pip_address`           | `object`            | Details for the public IP address, including name and allocation method.   |
| `interface_name`        | `string`            | Base name for the network interfaces.                                      |
| `subnets_id`            | `string`            | The subnet ID for associating network interfaces.                          |
| `private_ip`            | `string`            | Private IP address allocation method (Static/Dynamic).                    |
| `nsg-id`                | `string`            | The NSG ID for the network interfaces.                                     |
| `nic_count`             | `number`            | Number of network interfaces to create.                                    |
| `tags`                  | `map(string)`       | Tags to be applied to resources for categorization (default: `{ Env = "dev" }`). |

### Example Input Variables


## Outputs

After applying the module, the following outputs will be available:

| Output Name   | Description                                                            |
|---------------|------------------------------------------------------------------------|
| `nic_id`      | The IDs of all network interfaces created for the virtual machines.     |
| `pip_id`      | The IDs of all public IP addresses associated with the network interfaces.|

### Example Output Usage


## Usage

To use this module, include it in your Terraform configuration as follows:


## Conclusion

This module simplifies the creation of Azure public IP addresses and network interfaces, allowing users to efficiently manage their cloud infrastructure. Adjust the input variables as needed to fit your deployment requirements.
