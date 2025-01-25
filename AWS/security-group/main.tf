# Create a security group resource for web applications
resource "aws_security_group" "web" {
  vpc_id      = var.vpc_id
  name        = var.web_security_group_name
  description = var.web_security_group_description
  tags = {
    Name = var.web_security_group_name
  }
}

# Create ingress rules for the web security group (Inbound rules)
resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = local.web_security_ingress_count
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.web_security_group_rules[count.index].cidr_ipv4
  from_port         = var.web_security_group_rules[count.index].from_port
  to_port           = var.web_security_group_rules[count.index].to_port
  ip_protocol       = var.web_security_group_rules[count.index].ip_protocol

}

# Create a default egress rule for the web security group (outbound rules)
resource "aws_vpc_security_group_egress_rule" "default" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1

}

# Create a security group resource for the database
resource "aws_security_group" "db" {
  vpc_id      = var.vpc_id
  name        = var.db_security_group_name
  description = var.db_security_group_description
  tags = {
    Name = var.db_security_group_name
  }
}

# Create ingress rules for the database security group (Inbound rules)
resource "aws_vpc_security_group_ingress_rule" "db" {
  count             = local.db_security_ingress_count
  security_group_id = aws_security_group.db.id
  cidr_ipv4         = var.db_security_group[count.index].cidr_ipv4
  from_port         = var.db_security_group[count.index].from_port
  to_port           = var.db_security_group[count.index].to_port
  ip_protocol       = var.db_security_group[count.index].ip_protocol

}

# Create a default egress rule for the database security group (outbound rules)
resource "aws_vpc_security_group_egress_rule" "dbdefault" {
  security_group_id = aws_security_group.db.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1
}
