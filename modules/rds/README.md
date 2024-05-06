# Ikigai Relational Database Service Terraform Module

This module deploys the AWS Relational Database Service (RDS) infrastructure required for an Ikigai application setup.

## Usage

To use the RDS module, the ids of two rds subnets as well as the VPC's security groups are needed as input. This can be done using the outputs of the Ikigai VPC module, or by creating data sources that link to existing subnets and security groups.

This is an example using the RDS module with the Ikigai VPC module outputs.

```hcl
module "aws-infrastructure_vpc" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/vpc"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  availability_zone_1 = "us-east-2a"
  availability_zone_2 = "us-east-2b"
}

module "aws-infrastructure_rds" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/rds"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  vpc_security_group_id = module.aws-infrastructure_vpc.vpc_security_group_id
  vpn_security_group_id = module.aws-infrastructure_vpc.vpn_security_group_id
  rds_subnet_1_id = module.aws-infrastructure_vpc.rds_subnet_1_id
  rds_subnet_2_id = module.aws-infrastructure_vpc.rds_subnet_2_id
  airbyte_password = "pA5Sw0rd"
  airbyte_username = "example-username"
  dashhub_password = "pA5Sw0rd"
  dashhub_username = "example-username"
  database_password = "pA5Sw0rd"
  database_username = "example-username"
  jupyterhub_password = "pA5Sw0rd"
  jupyterhub_username = "example-username"
  pipeline_password = "pA5Sw0rd"
  pipeline_username = "example-username"
  service_metadata_password = "pA5Sw0rd"
  service_metadata_username = "example-username"
  superset_password = "pA5Sw0rd"
  superset_username = "example-username"
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

# Get information of the rds subnets in the VPC using its CIDR block or any tags it has
data "aws_subnet" "rds_subnet_1" {
  cidr_block = "16.0.3.0/24"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "rds-subnet-1"
  }
}

data "aws_subnet" "rds_subnet_2" {
  cidr_block = "16.0.4.0/24"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "rds-subnet-2"
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

# Create the RDS infrastructure
module "aws-infrastructure_rds" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/rds"
  version = "~> 0.0"
  
  aws_region = data.aws_region.current
  vpc_security_group_id = data.aws_security_group.vpc_security_group.id
  vpn_security_group_id = data.aws_security_group.vpn_security_group.id
  rds_subnet_1_id = data.aws_subnet.rds_subnet_1.id
  rds_subnet_2_id = data.aws_subnet.rds_subnet_2.id
  airbyte_password = "pA5Sw0rd"
  airbyte_username = "example-username"
  dashhub_password = "pA5Sw0rd"
  dashhub_username = "example-username"
  database_password = "pA5Sw0rd"
  database_username = "example-username"
  jupyterhub_password = "pA5Sw0rd"
  jupyterhub_username = "example-username"
  pipeline_password = "pA5Sw0rd"
  pipeline_username = "example-username"
  service_metadata_password = "pA5Sw0rd"
  service_metadata_username = "example-username"
  superset_password = "pA5Sw0rd"
  superset_username = "example-username"
}
```

It is possible to further customize the RDS deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| airbyte_password | Password for the Airbyte RDS server | `string` | n/a | yes |
| airbyte_username | Username for the Airbyte RDS server | `string` | n/a | yes |
| airbyte_server_instance | Instance type for the Airbyte RDS server | `string` | `"db.t3.small"` | no |
| airbyte_server_name | Name of the Airbyte RDS server | `string` | `"airbyte-ikigai"` | no |
| airbyte_server_storage | Allocated storage for the Airbyte RDS server (in gibibytes) | `number` | `20` | no |
| aws_region | The AWS region that the RDS infrastructure will be deployed in | `string` | n/a | yes |
| dashhub_password | Password for the Dashhub RDS server | `string` | n/a | yes |
| dashhub_username | Username for the Dashhub RDS server | `string` | n/a | yes |
| dashhub_server_instance | Instance type for the Dashhub RDS server | `string` | `"db.t3.small"` | no |
| dashhub_server_name | Name of the Dashhub RDS server | `string` | `"dashhub-ikigai"` | no |
| dashhub_server_storage | Allocated storage for the Dashhub RDS server (in gibibytes) | `number` | `20` | no |
| database_password | Password for the database storage RDS server | `string` | n/a | yes |
| database_username | Username for the database storage RDS server | `string` | n/a | yes |
| database_server_instance | Instance type for the database storage RDS server | `string` | `"db.t3.small"` | no |
| database_server_name | Name of the database storage RDS server | `string` | `"database-storage-ikigai"` | no |
| database_server_storage | Allocated storage for the database storage RDS server (in gibibytes) | `number` | `20` | no |
| engine_version | Postgres engine version for all RDS servers | `string` | `"12.17"` | no |
| jupyterhub_password | Password for the Jupyterhub RDS server | `string` | n/a | yes |
| jupyterhub_username | Username for the Jupyterhub RDS server | `string` | n/a | yes |
| jupyterhub_server_instance | Instance type for the Jupyterhub RDS server | `string` | `"db.t3.small"` | no |
| jupyterhub_server_name | Name of the Jupyterhub RDS server | `string` | `"juptyterhub-ikigai"` | no |
| jupyterhub_server_storage | Allocated storage for the Jupyterhub RDS server (in gibibytes) | `number` | `20` | no |
| monitoring_interval | Interval, in seconds, between points when Enhanced Monitoring metrics are collected | `number` | `60` | no |
| parameter_group_name | The parameter group name for all created RDS servers | `number` | `"default.postgres12"` | no |
| pipeline_password | Password for the pipeline staging RDS server | `string` | n/a | yes |
| pipeline_username | Username for the pipeline staging RDS server | `string` | n/a | yes |
| pipeline_server_instance | Instance type for the pipeline staging RDS server | `string` | `"db.m5.xlarge"` | no |
| pipeline_server_name | Name of the pipeline staging RDS server | `string` | `"pipeline-staging-ikigai"` | no |
| pipeline_server_storage | Allocated storage for the pipeline staging RDS server (in gibibytes) | `number` | `50` | no |
| port | The database port for all created RDS servers | `number` | `5432` | no |
| rds_subnet_1_id | Id of the first of two rds subnets that the RDS servers will be deployed in | `string` | n/a | yes |
| rds_subnet_2_id | Id of the second of two rds subnets that the RDS servers will be deployed in | `string` | n/a | yes |
| service_metadata_password | Password for the service metadata RDS server | `string` | n/a | yes |
| service_metadata_username | Username for the service metadata RDS server | `string` | n/a | yes |
| service_metadata_server_instance | Instance type for the service metadata RDS server | `string` | `"db.t2.small"` | no |
| service_metadata_server_name | Name of the service metadata RDS server | `string` | `"service-metadata-ikigai"` | no |
| service_metadata_server_storage | Allocated storage for the service metadata RDS server (in gibibytes) | `number` | `100` | no |
| superset_password | Password for the Superset RDS server | `string` | n/a | yes |
| superset_username | Username for the Superset RDS server | `string` | n/a | yes |
| superset_server_instance | Instance type for the Superset RDS server | `string` | `"db.t3.small"` | no |
| superset_server_name | Name of the Superset RDS server | `string` | `"superset-ikigai"` | no |
| superset_server_storage |  Allocated storage for the Superset RDS server (in gibibytes) | `number` | `20` | no |
| vpc_security_group_id | Id of the security group for allowing intra-VPC traffic | `string` | n/a | yes |
| vpn_security_group_id | Id of the security group for allowing traffic through the VPN | `string` | n/a | yes |

## Outputs

These values will be placed into the environment files in the Ikigai Helm chart during the microservices setup.

| Name | Description |
|------|-------------|
| airbyte_db_hostname | Hostname of the Airbyte RDS server |
| airbyte_db_name | Name of the database in the Airbyte RDS server |
| airbyte_db_password | Password for the Airbyte RDS server |
| airbyte_db_port | Port for the Airbyte RDS server |
| airbyte_db_username | Username for the Airbyte RDS server |
| dashhub_db_hostname | Hostname of the Dashhub RDS server |
| dashhub_db_name | Name of the database for the Airbyte RDS server |
| dashhub_db_password | Password for the Dashhub RDS server |
| dashhub_db_port | Port for the Dashhub RDS server |
| dashhub_db_username | Username for the Airbyte RDS server |
| database_storage_db_hostname | Hostname of the database storage RDS server |
| database_storage_db_name | Name of the database for the database storage RDS server |
| database_storage_db_password | Password for the database storage RDS server |
| database_storage_db_port | Port for the database storage RDS server |
| database_storage_db_username | Username for the database storage RDS server |
| jupyterhub_db_endpoint | Endpoint for the Jupyterhub RDS server |
| pipeline_staging_db_endpoint | Endpoint for the pipeline staging RDS server |
| service_metadata_db_endpoint | Endpoint for the service metadata RDS server |
| superset_db_endpoint | Endpoint for the Superset RDS server |