# Create a aws internet gateway resource
resource "aws_internet_gateway" "base" {
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# # Create an Elastic IP for the NAT Gateway
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
# }

# # Create a NAT Gateway using the Elastic IP
# resource "aws_nat_gateway" "db_natgate" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public[1].id
#   tags = {
#     Name = "${var.vpc_name}-natgate"
#   }
# }

# Create a aws public route table network resource and add route in public route table to internet gateway
resource "aws_route_table" "public" {
  count  = local.public_subnet_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.route_table_name}_public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.base.id
  }
}

# public subnet resource associate with public route table
resource "aws_route_table_association" "public" {
  count          = local.public_subnet_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id

}

# Create a aws private route table network resource
resource "aws_route_table" "private" {
  count  = local.private_subnet_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.route_table_name}_private"
  }
  # route {
  #   cidr_block     = local.anywhere
  #   nat_gateway_id = aws_nat_gateway.db_natgate.id
  # }
}

# private subnet resource associate with public route table 
resource "aws_route_table_association" "private" {
  count          = local.private_subnet_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}
