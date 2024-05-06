# Ikigai Elasticsearch Terraform Module

This module deploys the AWS Elasticsearchh infrastructure required for an Ikigai application setup.

## Usage

To use the Elasticsearch module, the ids of two private subnets as well as the VPC's security groups are needed as input. This can be done using the outputs of the Ikigai VPC module, or by creating data sources that link to existing subnets and security groups.

This is an example using the Elasticsearch module with the Ikigai VPC module outputs.

```hcl
module "aws-infrastructure_vpc" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/vpc"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  availability_zone_1 = "us-east-2a"
  availability_zone_2 = "us-east-2b"
}

module "aws-infrastructure_elasticsearch" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/elasticsearch"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  private_subnet_1_id = module.aws-infrastructure_vpc.private_subnet_1_id
  private_subnet_2_id = module.aws-infrastructure_vpc.private_subnet_2_id
  vpc_security_group_id = module.aws-infrastructure_vpc.vpc_security_group_id
  vpn_security_group_id = module.aws-infrastructure_vpc.vpn_security_group_id
  component_logs_password = "pA5Sw0rd"
  component_logs_username = "example-username"
  monitor_password = "pA5Sw0rd"
  monitor_username = "example-username"
}
```

This is an example using the RDS module with an existing VPC and subnets

```hcl
# Get current region
data "aws_region" "current" {}

# Get information of the existing VPC using its CIDR and tags
data "aws_vpc" "existing_vpc" {
  cidr_block = "16.0.0.0/16"
  tags = {
    "Name" = "existing-vpc"
  }
}

# Get information of the private subnets in the VPC using its CIDR block or any tags it has
data "aws_subnet" "private_subnet_1" {
  cidr_block = "16.0.32.0/24"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "private-subnet-1"
  }
}

data "aws_subnet" "private_subnet_2" {
  cidr_block = "16.0.64.0/24"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "private-subnet-2"
  }
}

# Get information of the vpc and vpn security groups using its name
data "aws_security_group" "vpc_security_group" {
  name = "existing-vpc-security-group"
  vpc_id = data.aws_vpc.uae_vpc.id
}

data "aws_security_group" "vpn_security_group" {
  name = "existing-vpn-security-group"
  vpc_id = data.aws_vpc.uae_vpc.id
}

# Create the Elasticsearch infrastructure
module "aws-infrastructure_elasticsearch" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/elasticsearch"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  private_subnet_1_id = data.aws_subnet.private_subnet_1.id
  private_subnet_2_id = data.aws_subnet.private_subnet_2.id
  vpc_security_group_id = data.aws_security_group.vpc_security_group.id
  vpn_security_group_id = data.aws_security_group.vpn_security_group.id
  component_logs_password = "pA5Sw0rd"
  component_logs_username = "example-username"
  monitor_password = "pA5Sw0rd"
  monitor_username = "example-username"
}
```

It is possible to further customize the RDS deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region that the RDS infrastructure will be deployed in | `string` | n/a | yes |
| component_logs_password | Password for the component logs Elasticsearch cluster | `string` | n/a | yes |
| component_logs_username | Username for the component logs Elasticsearch cluster | `string` | n/a | yes |
| monitor_password | Password for the monitoring Elasticsearch cluster | `string` | n/a | yes |
| monitor_username | Username for the monitoring Elasticsearch cluster | `string` | n/a | yes |
| private_subnet_1_id | Id of the first of two private subnets | `string` | n/a | yes |
| private_subnet_2_id | Id of the second of two private subnets | `string` | n/a | yes |
| vpc_security_group_id | Id of the security group for allowing intra-VPC traffic | `string` | n/a | yes |
| vpn_security_group_id | Id of the security group for allowing traffic through the VPN | `string` | n/a | yes |
| component_logs_ebs_iops | Baseline I/O performance of EBS volumes attached to data nodes for the component logs Elasticsearch cluster | `number` | `3000` | no |
| component_logs_ebs_throughput | The throughput (in MiB/s) of the EBS volumes attached to data nodes for the component logs Elasticsearch cluster | `number` | `125` | no |
| component_logs_ebs_volume_size | Size of EBS volumes attached to data nodes for the component logs Elasticsearch cluster | `number` | `20` | no |
| component_logs_instance_count | Number of instances in the component logs Elasticsearch cluster | `number` | `2` | no |
| component_logs_instance_type | Instance type of data nodes in the component logs Elasticsearch cluster | `string` | `"m5.large.elasticsearch"` | no |
| component_logs_master_count | Number of dedicated main nodes in the component logs Elasticsearch cluster | `number` | `1` | no |
| component_logs_master_type | Instance type of the dedicated main nodes in the component logs Elasticsearch cluster | `string` | `"r5.large.elasticsearch"` | no |
| component_logs_name | Name of the component logs Elasticsearch cluster | `string` | `"component-logs"` | no |
| component_logs_version | Version of Elasticsearch to deploy for the component logs Elasticsearch cluster | `string` | `"7.1"` | no |
| component_logs_warm_count | Number of warm nodes in the component logs Elasticsearch cluster | `number` | `2` | no |
| component_logs_warm_type | Instance type for the component logs Elasticsearch cluster's warm nodes | `string` | `"ultrawarm1.medium.elasticsearch"` | no |
| monitor_ebs_volume_size | Size of EBS volumes attached to data nodes for the monitoring Elasticsearch cluster | `number` | `20` | no |
| monitor_elasticsearch_name | Name of the monitoring Elasticsearch cluster | `string` | `"monitoring"` | no |
| monitor_elasticsearch_version | Version of Elasticsearch to deploy for the monitoring Elasticsearch cluster | `string` | `"7.1"` | no |
| monitor_instance_count | Number of instances in the monitoring Elasticsearch cluster | `number` | `2` | no |
| monitor_instance_type | Instance type of data nodes in the monitoring Elasticsearch cluster | `string` | `"m5.large.elasticsearch"` | no |

## Outputs

These values will be placed into the environment files in the Ikigai Helm chart during the microservices setup.

| Name | Description |
|------|-------------|
| elasticsearch_component_logs_hostname | "Hostname of the component logs Elasticsearch instance" |
| elasticsearch_monitoring_hostname | "Hostname of the monitoring Elasticsearch instance" |