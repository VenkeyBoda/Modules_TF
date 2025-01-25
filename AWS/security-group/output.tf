# Output the ID of the web security group
output "web_security_id" {
    value = aws_security_group.web.id
  
}

# Output the ID of the database security group
output "db_security_id" {
    value = aws_security_group.db.id 
  
}