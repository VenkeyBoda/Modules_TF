# Terraform Security Groups Module

This module provides reusable Terraform code to create and manage AWS security groups for web applications and databases. It also allows defining ingress and egress rules for each security group.

## Features

- **Web Security Group**: 
  - Create a security group for web applications.
  - Define ingress rules for web access.
  - Default egress rule allowing outbound access to anywhere.

- **Database Security Group**:
  - Create a security group for databases.
  - Define ingress rules for database access.
  - Default egress rule allowing outbound access to anywhere.

## Inputs

### General Variables

| Name                           | Type   | Description                                       | Default     |
|--------------------------------|--------|---------------------------------------------------|-------------|
| `vpc_id`                       | string | The ID of the VPC where the security groups will be created. | N/A         |

### Web Security Group Variables

| Name                           | Type   | Description                                       | Default     |
|--------------------------------|--------|---------------------------------------------------|-------------|
| `web_security_group_name`      | string | The name of the web security group.              | N/A         |
| `web_security_group_description` | string | The description of the web security group.       | N/A         |
| `web_security_group_rules`     | list(object) | A list of ingress rules for the web security group. Each rule includes: | `[]` (empty list) |
|                                |        | - `cidr_ipv4` (optional): CIDR block for ingress rule. Default is `0.0.0.0/0`. |             |
|                                |        | - `from_port`: Starting port for the rule.       |             |
|                                |        | - `to_port`: Ending port for the rule.           |             |
|                                |        | - `ip_protocol` (optional): Protocol for the rule. Default is `tcp`. |             |

### Database Security Group Variables

| Name                           | Type   | Description                                       | Default     |
|--------------------------------|--------|---------------------------------------------------|-------------|
| `db_security_group_name`       | string | The name of the database security group.         | N/A         |
| `db_security_group_description` | string | The description of the database security group.  | N/A         |
| `db_security_group`            | list(object) | A list of ingress rules for the database security group. Each rule includes: | `[]` (empty list) |
|                                |        | - `cidr_ipv4` (optional): CIDR block for ingress rule. Default is `0.0.0.0/0`. |             |
|                                |        | - `from_port`: Starting port for the rule.       |             |
|                                |        | - `to_port`: Ending port for the rule.           |             |
|                                |        | - `ip_protocol` (optional): Protocol for the rule. Default is `tcp`. |             |

## Outputs

| Name                  | Description                                      |
|-----------------------|--------------------------------------------------|
| `web_security_id`     | The ID of the created web security group.        |
| `db_security_id`      | The ID of the created database security group.   |

## Example Usage

```hcl
module "security_groups" {
  source = "./path-to-this-module"

  vpc_id                       = "vpc-12345678"

  web_security_group_name      = "web-sg"
  web_security_group_description = "Security group for web applications"
  web_security_group_rules = [
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
    },
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
    }
  ]

  db_security_group_name       = "db-sg"
  db_security_group_description = "Security group for database"
  db_security_group = [
    {
      cidr_ipv4   = "10.0.0.0/16"
      from_port   = 3306
      to_port     = 3306
      ip_protocol = "tcp"
    }
  ]
}
```

## Notes
- Ensure the VPC ID provided matches the one where your resources are deployed.
- Define ingress rules carefully to avoid exposing sensitive resources unnecessarily.
