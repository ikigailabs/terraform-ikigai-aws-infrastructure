# Ikigai VPC Terraform Module

This module allows you to create the AWS Virtual Private Cloud infrastructure necessary for an Ikigai application setup.

## Usage

A simple usage example of the Ikigai DynamoDB module, only setting the required variables, would be:

```hcl
module "aws-infrastructure_vpc" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/vpc"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  availability_zone_1 = "us-east-2a"
  availability_zone_2 = "us-east-2b"
}
```

It is possible to further customize the deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability_zone_1 | The first of two availablity zones to deploy subnets in - value should be the `aws_region` input followed by the az identifier | `string` | n/a | yes |
| availability_zone_2 | The second of two availablity zones to deploy subnets in - value should be the `aws_region` input followed by the az identifier | `string` | n/a | yes |
| aws_region | The AWS region that the DynamoDB infrastructure will be deployed in | `string` | n/a | yes |
| internet_gateway_name | Name of the internet gateway for the Ikigai VPC | `string`  | `"internet-gateway"` | no |
| nat_gateway_name | Name of the NAT gateway for the Ikigai VPC | `string`  | `"nat-gateway"` | no |
| nat_subnet_cidr | CIDR block of the subnet that houses the NAT Gateway | `string` | `"16.0.5.0/24"` | no |
| nat_subnet_name | Name of the subnet that houses the NAT Gateway | `string` | `"subnet-nat"` | no |
| private_subnet_1_cidr | CIDR block for the first of two private subnets - the CIDR prefix is 19 to allow the subnet to house more instances | `string` | `"16.0.32.0/19"` | no |
| private_subnet_1_name | Name for the first of two private subnets | `string` | `"private-1"` | no |
| private_subnet_2_cidr | CIDR block for the second of two private subnets  - the CIDR prefix is 19 to allow the subnet to house more instances | `string` | `"16.0.64.0/19"` | no |
| private_subnet_2_name | Name for the second of two private subnets | `string` | `"private-2"` | no |
| public_subnet_1_cidr | CIDR block for the first of two public subnets | `string` | `"16.0.1.0/24"` | no |
| public_subnet_1_name | Name for the first of two public subnets | `string` | `"public-1"` | no |
| public_subnet_2_cidr | CIDR block for the second of two public subnets | `string` | `"16.0.2.0/24"` | no |
| public_subnet_2_name | Name for the second of two public subnets | `string` | `"public-2"` | no |
| rds_subnet_1_cidr | CIDR block for the first of two RDS subnets, which will store the RDS servers | `string` | `"16.0.3.0/24"` | no |
| rds_subnet_1_name | Name for the first of two RDS subnets, which will store the RDS servers | `string` | `"rds-1"` | no |
| rds_subnet_2_cidr | CIDR block for the second of two RDS subnets, which will store the RDS servers | `string` | `"16.0.4.0/24"` | no |
| rds_subnet_2_name | Name for the second of two RDS subnets, which will store the RDS servers | `string` | `"rds-2"` | no |
| vpc_cidr | CIDR block for the Ikigai VPC | `string` | `"16.0.0.0/16"` | no |
| vpc_name | Name of the Ikigai VPC | `string`  | `"ikigai-vpc"` | no |
| vpc_security_group_name | Name of the security group for allowing intra-VPC traffic | `string` | `"vpc-security-group"` | no |
| vpn_gateway_name | Name of the VPN gateway | `string` | `"vpn-gateway"` | no |
| vpn_security_group_name | Name of the security group for allowing traffic through the VPN | `string` | `"vpn-security-group"` | no |

## Outputs

These outputs will serve as inputs for other Ikigai modules that need a VPC, namely, the EKS, Elasticsearch, and RDS modules.

| Name | Description |
|------|-------------|
| private_subnet_1_id | Id of the first of two private subnets |
| private_subnet_2_id | Id of the second of two private subnets |
| rds_subnet_1_id | Id of the first of two RDS subnets |
| rds_subnet_2_id | Id of the second of two RDS subnets |
| vpc_id | Id of the VPC |
| vpc_security_group_id | Id of the security group for allowing intra-VPC traffic |
| vpn_security_group_id | Id of the security group for allowing traffic through the VPN |