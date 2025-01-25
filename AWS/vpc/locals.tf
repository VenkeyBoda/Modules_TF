# ==========================
# Local Variables
# ==========================

locals {
  anywhere                   = "0.0.0.0/0"
  public_subnet_count        = length(var.public_cidr)           # Count of public subnets defined in the variable
  private_subnet_count       = length(var.private_cidr)          # Count of private subnets defined in the variable
}
