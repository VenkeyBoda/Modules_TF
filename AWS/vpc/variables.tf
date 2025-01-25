# Variable for the name of the VPC
variable "vpc_name" {
    type = string
  
}

# Variable for the CIDR block of the VPC
variable "vpc_cidr" {
    type = string
  
}

# Variable for the availability zones for public subnets
variable "public_az" {
    type = list(string)
  
}

# Variable for CIDR blocks of public subnets
variable "public_cidr" {
    type = list(string)
  
}

# Variable for the availability zones for private subnets
variable "private_az" {
    type = list(string)
  
}

# Variable for CIDR blocks of private subnets
variable "private_cidr" {
    type=list(string)
  
}

# Variable for the route table name with a default value
variable "route_table_name" {
    type = string
    default = "route_table"
  
}