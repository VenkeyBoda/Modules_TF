# create a RDS DB subnet group resource with private subnet
resource "aws_db_subnet_group" "db_default" {
  name       = "private_subnet_group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = var.subnet_group_name
  }
}

# Resource for creating an RDS database instance
resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_instance.allocated_storage
  db_name              = var.db_instance.db_name
  engine               = var.db_instance.engine
  engine_version       = var.db_instance.engine_version
  instance_class       = var.db_instance.instance_class
  username             = var.db_instance.username
  password             = var.db_instance.password
  skip_final_snapshot  = var.db_instance.skip_final_snapshot
  db_subnet_group_name = aws_db_subnet_group.db_default.id

  # Attach the DB security group  
  vpc_security_group_ids = [var.vpc_security_group_ids]
  tags = {
    Name = var.database_name
  }
}
