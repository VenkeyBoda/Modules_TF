
# Terraform Module: RDS DB Instance with Private Subnet

This Terraform module provisions an Amazon RDS database instance within a private subnet. It creates an RDS DB subnet group, launches an RDS instance, and provides the necessary configuration to connect to the database.

## Resources Created
- **aws_db_subnet_group**: Creates a DB subnet group with the specified private subnets.
- **aws_db_instance**: Creates an RDS database instance in the specified subnet group and applies the necessary configurations such as engine type, storage, and security groups.

## Requirements
- Terraform 1.x or higher.
- AWS account and proper credentials set up.

## Usage

To use this module, you need to include it in your Terraform configuration and specify the required inputs.

### Example

```hcl
module "rds_instance" {
  source = "./path/to/module"

  subnet_ids               = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
  subnet_group_name        = "private_subnet_group"
  vpc_security_group_ids   = "sg-xxxxxxxx"
  database_name            = "my_database_name"

  db_instance = {
    allocated_storage   = "20"
    db_name             = "my_db"
    engine              = "mysql"
    engine_version      = "8.0"
    instance_class      = "db.t3.micro"
    username            = "my_rds_user"
    password            = "my_secret_password"
    skip_final_snapshot = true
  }
}
```

## Inputs

| Name                        | Description                                                                 | Type     | Default          | Required |
|-----------------------------|-----------------------------------------------------------------------------|----------|------------------|----------|
| `subnet_ids`                | A list of subnet IDs where the RDS instance will be deployed.               | list(string) | `[]`            | Yes      |
| `subnet_group_name`         | The name of the DB subnet group to be created.                              | string   | `""`             | Yes      |
| `vpc_security_group_ids`    | The security group IDs associated with the RDS instance.                    | string   | `""`             | Yes      |
| `database_name`             | The name of the database to create within the RDS instance.                 | string   | `""`             | Yes      |
| `db_instance`               | Configuration for the RDS database instance (allocated_storage, db_name, engine, etc.). | map(string) | Default values for db instance. | Yes      |

### Example of `db_instance` variable:

```hcl
db_instance = {
  allocated_storage   = "20"
  db_name             = "my_db"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  username            = "my_rds_user"
  password            = "my_secret_password"
  skip_final_snapshot = true
}
```

## Outputs

| Name          | Description                                               | Type   |
|---------------|-----------------------------------------------------------|--------|
| `rds_endpoint` | The command to connect to the RDS database instance.      | string |

### Example of `rds_endpoint` output:

After applying the module, you can use the following command to connect to your RDS instance:

```bash
mysql -h <rds-endpoint> -P 3306 -u my_rds_user -p
```

Replace `<rds-endpoint>` with the actual value returned from the output `rds_endpoint`.
