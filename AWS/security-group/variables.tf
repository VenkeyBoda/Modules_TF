# Variable for the VPC ID where the security groups will be created
variable "vpc_id" {
    type = string
}

# Variable for the name of the web security group
variable "web_security_group_name" {
    type = string
}

# Variable for the description of the web security group
variable "web_security_group_description" {
    type = string
}

# Web Security Group Rules Variable
variable "web_security_group_rules" {
    type = list(object({
        cidr_ipv4   = optional(string, "0.0.0.0/0")
        from_port   = number  # The starting port for the rule
        to_port     = number  # The ending port for the rule
        ip_protocol = optional(string, "tcp")
    }))
}

# Variable for the name of the database security group
variable "db_security_group_name" {
    type = string 
}

# Variable for the description of the database security group
variable "db_security_group_description" {
    type = string
}

# Database Security Group Rules Variable
variable "db_security_group" {
    type = list(object({
        cidr_ipv4   = optional(string, "0.0.0.0/0")
        from_port   = number  # The starting port for the rule
        to_port     = number  # The ending port for the rule
        ip_protocol = optional(string, "tcp")
    }))
}
