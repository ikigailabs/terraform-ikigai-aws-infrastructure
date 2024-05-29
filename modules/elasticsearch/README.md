# Ikigai Elasticsearch Terraform Module

This module deploys the AWS Elasticsearch infrastructure required for an Ikigai application setup.

## Usage

To use the Elasticsearch module, the ids of two private subnets as well as the VPC's security groups are needed as input. Pass them in using data sources that link to existing subnets and security groups.

This is a simple example usage of the Elasticsearch module, only setting the required inputs:

```hcl
module "aws-infrastructure_elasticsearch" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/elasticsearch"
  version = "~> 1.0"
  
  aws_region = module.aws-infrastructure_vpc.vpc_region
  private_subnet_1_id = data.aws_subnet.private_subnet_1.id
  private_subnet_2_id = data.aws_subnet.private_subnet_2.id
  vpc_security_group_id = data.aws_security_group.vpc_security_group.id
  vpn_security_group_id = data.aws_security_group.vpn_security_group.id
  component_logs_password = "REQUIRED_PASSWORD"
  component_logs_username = "REQUIRED_USERNAME"
  monitor_password = "REQUIRED_PASSWORD"
  monitor_username = "REQUIRED_USERNAME"
}
```

It is possible to further customize the RDS deployment using the inputs listed below. To do so, add `[input name] = target_value` within the module braces.
For example, to set the `component_logs_instance_count` input to `2`, add `component_logs_instance_count = 2` to the module block. Remember to add double quotes for string inputs! 

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
| component_logs_master_count | Number of dedicated main nodes in the component logs Elasticsearch cluster | `number` | `3` | no |
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