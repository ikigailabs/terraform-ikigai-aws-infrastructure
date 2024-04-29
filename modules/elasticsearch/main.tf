terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# Get information of the ikigai vpc
data "aws_vpc" "ikigai_vpc" {
  tags = {
    "Name" = var.vpc_name
  }
}

# Get information of the subnets the elasticsearch clusters will reside in
data "aws_subnet" "private_subnet_1" {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.private_subnet_name_1,
  }
}

data "aws_subnet" "private_subnet_2" {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.private_subnet_name_2,
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