
# Terraform Azure Network Security Group (NSG) Module

This Terraform module creates an Azure Network Security Group (NSG) with configurable security rules. It allows you to define custom rules with different priorities, directions, and access levels.

## Requirements

- Terraform 0.12 or later
- Azure Provider

## Usage

```hcl
module "nsg" {
  source = "./path-to-your-module"

  resource_group = "my-resource-group"
  location       = "East US"
  tags           = {
    Env = "production"
  }
  nsg_info = {
    name = "my-custom-nsg"
    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Deny-All"
        priority                   = 200
        direction                  = "Outbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
```

## Inputs

| Name                    | Type                                                                                      | Description                                                                                          | Default Value |
|-------------------------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|---------------|
| `resource_group`         | `string`                                                                                  | The name of the Azure resource group.                                                                | None (Required) |
| `location`               | `string`                                                                                  | The location where the resources will be created.                                                   | None (Required) |
| `tags`                   | `map(string)`                                                                              | A map of tags to assign to the resources.                                                            | `{ Env = "qa" }` |
| `nsg_info`               | `object`                                                                                  | The configuration for the Network Security Group and its security rules.                            | See below for structure |

**`nsg_info` Structure:**

| Name                          | Type                                | Description                                                                                       | Default Value       |
|-------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------|---------------------|
| `name`                         | `string`                            | The name of the Network Security Group.                                                           | `web-nsg`           |
| `security_rules`               | `list(object)`                      | A list of security rules for the Network Security Group.                                           | Empty list (Optional) |

**`security_rules` Structure:**

| Name                          | Type                                | Description                                                                                       | Default Value       |
|-------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------|---------------------|
| `name`                         | `string`                            | The name of the security rule.                                                                    | None (Required)     |
| `priority`                     | `number`                            | The priority of the security rule. Higher values are lower priority.                             | None (Required)     |
| `direction`                    | `string`                            | The direction of the rule (Inbound or Outbound).                                                   | `Inbound`           |
| `access`                       | `string`                            | The access rule (Allow or Deny).                                                                  | `Deny`              |
| `protocol`                     | `string`                            | The protocol for the rule (e.g., Tcp, Udp).                                                       | `Tcp`               |
| `source_port_range`            | `string`                            | The source port range (e.g., `*` for any).                                                        | `*`                 |
| `destination_port_range`       | `string`                            | The destination port range (e.g., `80`, `443`).                                                   | `*`                 |
| `source_address_prefix`        | `string`                            | The source address prefix (e.g., `*` for any).                                                    | `*`                 |
| `destination_address_prefix`   | `string`                            | The destination address prefix (e.g., `*` for any).                                               | `*`                 |

## Outputs

| Name                | Description                                    |
|---------------------|------------------------------------------------|
| `nsg_id`            | The ID of the created Network Security Group (NSG). |

## Example Output

```hcl
nsg_id = "/subscriptions/{subscription-id}/resourceGroups/my-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-custom-nsg"
```

## Notes

- If you don't specify the `nsg_info` or its security rules, the module will create an empty NSG without any security rules.
- The `tags` variable allows you to define metadata for the NSG. It defaults to `{ Env = "qa" }`.
- The `security_rules` allow you to configure multiple inbound and outbound rules based on your security needs.

## Authors

Module maintained by [Your Name](https://github.com/yourname).


