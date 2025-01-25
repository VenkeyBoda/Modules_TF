# Variable for RDS database instance configuration
variable "db_instance" {
  type = map(string)
  default = {
    allocated_storage   = "20"
    db_name             = "my_db"
    engine              = "mysql"
    engine_version      =  "8.0"
    instance_class      =  "db.t3.micro"
    username            = "my_rds"      # Master username for the database
    password            = "venkat0206"  # Master password for the database
    skip_final_snapshot = true          # Flag to skip final snapshot on deletion (true/false)

  }
}

# Variable for specifying subnet IDs where the RDS instance will be deployed
variable "subnet_ids" {
  type = list(string)
  
}

# Variable for naming the DB subnet group
variable "subnet_group_name" {
    type = string
  
}

# Variable for specifying VPC security group IDs associated with the RDS instance
variable "vpc_security_group_ids" {
    type = string
  
}

# Variable for specifying the name of the database
variable "database_name" {
    type=string
}