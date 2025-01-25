# VPC Module Terraform Configuration

This Terraform module sets up a Virtual Private Cloud (VPC) with public and private subnets, an Internet Gateway, a NAT Gateway, and corresponding route tables. It is designed to help users quickly set up a secure, scalable networking infrastructure on AWS.

## Module Features
- Creates a VPC with specified CIDR block.
- Configures public and private subnets across specified availability zones.
- Sets up an Internet Gateway and NAT Gateway for internet access.
- Automatically configures route tables and associates them with the corresponding subnets.

## Inputs

| Name              | Description                                        | Type         | Default       | Required |
|-------------------|----------------------------------------------------|--------------|---------------|----------|
| `vpc_name`        | The name of the VPC.                               | `string`     |               | yes      |
| `vpc_cidr`        | The CIDR block for the VPC.                        | `string`     |               | yes      |
| `public_az`       | List of availability zones for public subnets.     | `list(string)` |               | yes      |
| `public_cidr`     | List of CIDR blocks for public subnets.            | `list(string)` |               | yes      |
| `private_az`      | List of availability zones for private subnets.    | `list(string)` |               | yes      |
| `private_cidr`    | List of CIDR blocks for private subnets.           | `list(string)` |               | yes      |
| `route_table_name`| Base name for the route tables.                    | `string`     | `route_table` | no       |

## Outputs

| Name                  | Description                                         |
|-----------------------|-----------------------------------------------------|
| `public_subnet_count` | Number of public subnets created.                   |
| `private_subnet_count`| Number of private subnets created.                  |
| `vpc_id`              | ID of the created VPC.                              |
| `public_subnet_id`    | List of IDs of all public subnets.                  |
| `private_subnet_id`   | List of IDs of all private subnets.                 |

## Usage

```hcl
module "vpc" {
  source        = "path/to/your/module"
  vpc_name      = "my-vpc"
  vpc_cidr      = "10.0.0.0/16"
  public_az     = ["us-west-1a", "us-west-1b"]
  public_cidr   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_az    = ["us-west-1a", "us-west-1b"]
  private_cidr  = ["10.0.3.0/24", "10.0.4.0/24"]
  route_table_name = "my-route-table"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_id
}
```

## Notes
- Ensure that the CIDR blocks provided do not overlap and are within the VPC CIDR range.
- Availability zones should be chosen to ensure high availability and redundancy.
- The `route_table_name` variable is optional and can be customized to differentiate route tables in different environments.

This module simplifies the process of setting up a VPC with necessary networking components in AWS. Modify and expand the module as needed to fit specific project requirements.
