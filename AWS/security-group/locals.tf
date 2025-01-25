# ==========================
# Local Variables
# ==========================

locals {
  anywhere                   = "0.0.0.0/0"                          # CIDR block that allows access from anywhere
  web_security_ingress_count = length(var.web_security_group_rules) # Count of ingress rules for the web security group
  db_security_ingress_count  = length(var.db_security_group)  # Count of ingress rules for the database security group
}