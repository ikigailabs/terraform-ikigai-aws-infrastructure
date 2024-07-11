# Security group for allowing ingress traffic from the VPC and all egress traffic
resource "aws_security_group" "prod-vpc" {
  name = var.vpc_security_group_name
  description = "Allows all intra-VPC traffic"
  vpc_id = aws_vpc.prod.id
  ingress {
    cidr_blocks = [var.vpc_cidr]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = var.vpc_security_group_name
  }
}

# Security group for allowing ingress traffic with a VPN and allowing all egress traffic
resource "aws_security_group" "prod-vpn" {
  name = var.vpn_security_group_name
  description = "Allows traffic through VPN"
  vpc_id = aws_vpc.prod.id
  ingress {
    cidr_blocks = ["11.0.0.0/16"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = var.vpn_security_group_name
  }
}