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

resource "aws_db_subnet_group" "prod_rds_subnet_group" {
  name       = "prod_rds_subnet_group"
  subnet_ids = [var.rds_subnet_1_id, var.rds_subnet_2_id]
}