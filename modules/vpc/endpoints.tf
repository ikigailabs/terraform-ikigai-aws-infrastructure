resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.ec2"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.ecr.api"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "cloudformation" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.cloudformation"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.sts"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.monitoring"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "autoscaling" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.${var.aws_region}.autoscaling-plans"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.us-east-2.ecs"
  vpc_endpoint_type = "Interface"

    security_group_ids = [
    aws_security_group.prod-vpc.id, 
    aws_security_group.prod-vpn.id 
  ]
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id       = aws_vpc.prod.id
  service_name = "com.amazonaws.us-east-2.dynamodb"
  vpc_endpoint_type = "Gateway"
}

# VPN GW
resource "aws_vpn_gateway" "prod_vpn_gw" {
  vpc_id = aws_vpc.prod.id

  tags = {
    Name = "vpn-gateway"
  }
}