# Create a route table to send non-VPC traffic to the Internet Gateway
resource "aws_route_table" "internet_gateway_route_table" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

# Connect the nat gateway subnet and the internet gateway to allow access to the internet
resource "aws_route_table_association" "nat_subnet_igw_route_table_association" {
  subnet_id = aws_subnet.nat_gateway.id
  route_table_id = aws_route_table.internet_gateway_route_table.id
}

# Connect the public subnets and the internet gateway to allow access to the internet
resource "aws_route_table_association" "public_subnet1_igw_route_table_association" {
  subnet_id = aws_subnet.public_1.id
  route_table_id = aws_route_table.internet_gateway_route_table.id
}

resource "aws_route_table_association" "public_subnet2_igw_route_table_association" {
  subnet_id = aws_subnet.public_2.id
  route_table_id = aws_route_table.internet_gateway_route_table.id
}

# Create a route table to send non-VPC traffic to the NAT Gateway
resource "aws_route_table" "nat_gateway_route_table" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

# Connect the private subnets and the NAT gateway to allow access to the internet
resource "aws_route_table_association" "private_subnet1_natgw_route_table_association" {
  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}

resource "aws_route_table_association" "private_subnet2_natgw_route_table_association" {
  subnet_id = aws_subnet.private_2.id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}

# Connect the RDS subnets and the NAT gateway to allow access to the internet
resource "aws_route_table_association" "rds_subnet1_natgw_route_table_association" {
  subnet_id = aws_subnet.rds_1.id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}

resource "aws_route_table_association" "rds_subnet2_natgw_route_table_association" {
  subnet_id = aws_subnet.rds_2.id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}