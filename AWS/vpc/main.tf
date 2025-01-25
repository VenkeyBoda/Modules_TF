# Create a aws resource group for VPC
resource "aws_vpc" "base" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }

}

# Create subnets resource for public
resource "aws_subnet" "public" {
  count             = local.public_subnet_count
  vpc_id            = aws_vpc.base.id
  availability_zone = var.public_az[count.index]
  cidr_block        = var.public_cidr[count.index]
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}

# Create subnets resource for private  
resource "aws_subnet" "private" {
  count             = local.private_subnet_count
  vpc_id            = aws_vpc.base.id
  availability_zone = var.private_az[count.index]
  cidr_block        = var.private_cidr[count.index]
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}