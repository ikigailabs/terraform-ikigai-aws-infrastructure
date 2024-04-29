terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Get information of the ikigai vpc
data "aws_vpc" "ikigai_vpc" {
  tags = {
    "Name" = var.vpc_name
  }
}

# Get information of the subnets the rds servers will reside in
data "aws_subnet" "rds_subnet_1" {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.rds_subnet_name_1,
  }
}

data "aws_subnet" "rds_subnet_2" {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.rds_subnet_name_2,
  }
}

# Get information of the vpc and vpn security groups
data "aws_security_group" "vpc_security_group" {
  name = var.vpc_security_group_name
  vpc_id = data.aws_vpc.ikigai_vpc.id
}

data "aws_security_group" "vpn_security_group" {
  name = var.vpn_security_group_name
  vpc_id = data.aws_vpc.ikigai_vpc.id
}

resource "aws_db_subnet_group" "prod_rds_subnet_group" {
  name       = "prod_rds_subnet_group"
  subnet_ids = [data.aws_subnet.rds_subnet_1.id, data.aws_subnet.rds_subnet_2.id]
}