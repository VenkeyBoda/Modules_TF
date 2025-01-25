# Output the command to connect to the RDS database
output "rds_endpoint" {
  value = format("mysql -h %s -P -u %s -p",
    aws_db_instance.rds.endpoint,
    aws_db_instance.rds.username
  )
}