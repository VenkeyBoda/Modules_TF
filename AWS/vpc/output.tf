# Output the count of public subnets
output "public_subnet_count" {
    value = local.public_subnet_count
  
}

# Output the count of private subnets
output "private_subnet_count" {
    value = local.private_subnet_count
  
}

# Output the ID of the VPC
output "vpc_id" {
    value = aws_vpc.base.id
  
}

# Output the IDs of all public subnets
output "public_subnet_id" {
    value = aws_subnet.public[*].id
  
}

# Output the IDs of all private subnets
output "private_subnet_id" {
    value = aws_subnet.private[*].id
  
}