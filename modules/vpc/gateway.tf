# Internet Gateway for public subnet's and NAT subnet's acccess to the internet
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.internet_gateway_name
  }
}

# Public IP for NAT Gateway
resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

# NAT Gateways for private subnet's access to the internet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.nat_gateway.id
  tags = {
    "Name" = var.nat_gateway_name
  }
}