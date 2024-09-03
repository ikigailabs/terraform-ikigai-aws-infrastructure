# Ikigai Relational Database Service Terraform Module

This module deploys the AWS Relational Database Service (RDS) infrastructure required for an Ikigai application setup.

## Usage

To use the RDS module, the ids of two rds subnets as well as the VPC's security groups are needed as input. Pass them in using data sources that link to existing subnets and security groups.

This is a simple example usage of the RDS module, only setting the required inputs:

```hcl
module "aws-infrastructure_rds" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/rds"
  version = "~> 1.0"
  
  aws_region = module.aws-infrastructure_vpc.vpc_region
  vpc_security_group_id = data.aws_security_group.vpc_security_group.id
  vpn_security_group_id = data.aws_security_group.vpn_security_group.id
  rds_subnet_1_id = data.aws_subnet.rds_subnet_1.id
  rds_subnet_2_id = data.aws_subnet.rds_subnet_2.id
  airbyte_password = "REQUIRED_PASSWORD"
  airbyte_username = "REQUIRED_USERNAME"
  dashhub_password = "REQUIRED_PASSWORD"
  dashhub_username = "REQUIRED_USERNAME"
  database_password = "REQUIRED_PASSWORD"
  database_username = "REQUIRED_USERNAME"
  jupyterhub_password = "REQUIRED_PASSWORD"
  jupyterhub_username = "REQUIRED_USERNAME"
  pipeline_password = "REQUIRED_PASSWORD"
  pipeline_username = "REQUIRED_USERNAME"
  service_metadata_password = "REQUIRED_PASSWORD"
  service_metadata_username = "REQUIRED_USERNAME"
  superset_password = "REQUIRED_PASSWORD"
  superset_username = "REQUIRED_USERNAME"
}
```

It is possible to further customize the RDS deployment using the inputs listed below.  To do so, add `[input name] = target_value` within the module braces.
For example, to set the `airbyte_server_name` input to `airbyte`, add `airbyte_server_name = "airbyte"` to the module block. Remember to add double quotes for string inputs! 

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
| database_storage_server_password | Password for the database_storage RDS server | `string` | n/a | yes |
| database_storage_server_username | Username for the database_storage RDS server | `string` | n/a | yes |
| database_storage_server_instance | Instance type for the database_storage RDS server | `string` | `"db.t3.small"` | no |
| database_storage_server_name | Name of the database_storage RDS server | `string` | `"database-storage-ikigai"` | no |
| database_storage_server_storage | Allocated storage for the database_storage RDS server (in gibibytes) | `number` | `20` | no |
| engine_version | Postgres engine version for all RDS servers | `string` | `"12.17"` | no |
| jupyterhub_password | Password for the Jupyterhub RDS server | `string` | n/a | yes |
| jupyterhub_username | Username for the Jupyterhub RDS server | `string` | n/a | yes |
| jupyterhub_server_instance | Instance type for the Jupyterhub RDS server | `string` | `"db.t3.small"` | no |
| jupyterhub_server_name | Name of the Jupyterhub RDS server | `string` | `"juptyterhub-ikigai"` | no |
| jupyterhub_server_storage | Allocated storage for the Jupyterhub RDS server (in gibibytes) | `number` | `20` | no |
| monitoring_interval | Interval, in seconds, between points when Enhanced Monitoring metrics are collected | `number` | `60` | no |
| parameter_group_name | The parameter group name for all created RDS servers | `number` | `"default.postgres12"` | no |
| pipeline_password | Password for the pipeline_staging RDS server | `string` | n/a | yes |
| pipeline_username | Username for the pipeline_staging RDS server | `string` | n/a | yes |
| pipeline_server_instance | Instance type for the pipeline_staging RDS server | `string` | `"db.m5.xlarge"` | no |
| pipeline_server_name | Name of the pipeline_staging RDS server | `string` | `"pipeline-staging-ikigai"` | no |
| pipeline_server_storage | Allocated storage for the pipeline staging RDS server (in gibibytes) | `number` | `50` | no |
| port | The database port for all created RDS servers | `number` | `5432` | no |
| rds_subnet_1_id | Id of the first of two rds subnets that the RDS servers will be deployed in | `string` | n/a | yes |
| rds_subnet_2_id | Id of the second of two rds subnets that the RDS servers will be deployed in | `string` | n/a | yes |
| service_metadata_password | Password for the service_metadata RDS server | `string` | n/a | yes |
| service_metadata_username | Username for the service_metadata RDS server | `string` | n/a | yes |
| service_metadata_server_instance | Instance type for the service_metadata RDS server | `string` | `"db.t2.small"` | no |
| service_metadata_server_name | Name of the service_metadata RDS server | `string` | `"service-metadata-ikigai"` | no |
| service_metadata_server_storage | Allocated storage for the service_metadata RDS server (in gibibytes) | `number` | `100` | no |
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