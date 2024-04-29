# Two private subnets
resource "aws_subnet" "private_1" {
  availability_zone = var.availability_zone_1
  cidr_block = var.private_subnet_1_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.private_subnet_1_name,
    "kubernetes.io/cluster/first-prod" = "shared",
    "kubernetes.io/cluster/second-prod" = "shared",
    "kubernetes.io/cluster/demo-prod" = "shared",
    "kubernetes.io/role/internal-elb" = 1 
  }
}

resource "aws_subnet" "private_2" {
  availability_zone = var.availability_zone_2
  cidr_block = var.private_subnet_2_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.private_subnet_2_name,
    "kubernetes.io/cluster/first-prod" = "shared",
    "kubernetes.io/cluster/second-prod" = "shared",
    "kubernetes.io/cluster/demo-prod" = "shared",
    "kubernetes.io/role/internal-elb" = 1 
  }
}

# Two public subnets
resource "aws_subnet" "public_1" {
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true
  cidr_block = var.public_subnet_1_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.public_subnet_1_name,
    "kubernetes.io/cluster/main-prod" = "shared",
    "kubernetes.io/cluster/failover-prod" = "shared",
    "kubernetes.io/role/elb" = 1 
  }
}

resource "aws_subnet" "public_2" {
  availability_zone = var.availability_zone_2
  map_public_ip_on_launch = true
  cidr_block = var.public_subnet_2_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.public_subnet_2_name, 
    "kubernetes.io/cluster/main-prod" = "shared",
    "kubernetes.io/cluster/failover-prod" = "shared",
    "kubernetes.io/role/elb" = 1 
  }
}

# Two database subnets
resource "aws_subnet" "rds_1" {
  availability_zone = var.availability_zone_1
  cidr_block = var.rds_subnet_1_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.rds_subnet_1_name,
  }
}

resource "aws_subnet" "rds_2" {
  availability_zone = var.availability_zone_2
  cidr_block = var.rds_subnet_2_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.rds_subnet_2_name,
  }
}

# NAT Gateway Subnet
resource "aws_subnet" "nat_gateway" {
  availability_zone = var.availability_zone_1
  cidr_block = var.nat_subnet_cidr
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = var.nat_subnet_name
  }
}
