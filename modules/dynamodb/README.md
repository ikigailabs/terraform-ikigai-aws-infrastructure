# Ikigai DynamoDB Terraform Module

This module allows you to create the AWS DynamoDB infrastructure necessary for an Ikigai application setup.

## Usage

A simple usage example of the Ikigai DynamoDB module, only setting the required variables, would be:

```hcl
module "aws-infrastructure_dynamodb" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/dynamodb"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
}
```

A usage of the module that changes the name of the connections DynamoDB table, as well as its read and write capacity, would be:

```hcl
module "aws-infrastructure_dynamodb" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/dynamodb"
  version = "~> 0.0"
  
  aws_region = "us-east-2"

  connection_table_name = "new-table-name"
  connection_table_read_capacity = 1
  connection_table_write_capacity = 1
}
```

It is possible to further customize the deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region that the DynamoDB infrastructure will be deployed in | `string` | n/a | yes |
| connection_table_name | Name of the DynamoDB table for storing websocket connection information | `string` | `"connections-ikigai"` | no |
| connection_table_read_capacity | Number of read units for the connections table | `number` | `50` | no |
| connection_table_write_capacity | Number of write units for the connections table | `number` | `2` | no |
| facet_templates_table_name | Name of the DynamoDB table for storing facet templates | `string` | `"facet-templates-ikigai` | no |
| facet_templates_table_read_capacity | Number of read units for the facet templates table | `number` | `1` | no |
| facet_templates_table_write_capacity | Number of write units for the facet templates table  | `number` | `1` | no |
| lock_table_name | Name of the DynamoDB table for storing Ikigai component locks | `string` | `"lock-table-ikigai"` | no |
| lock_table_read_capacity | Number of read units for the lock table | `number` | `10` | no |
| lock_table_write_capacity | Number of write units for the lock table | `number` | `10` | no |
| pypr_lock_table_name | Name of the DynamoDB table for for storing pypr locks | `string` | `"pypr-locks-ikigai"` | no |
| pypr_lock_table_read_capacity | Number of read units for the pypr lock table | `number` | `10` | no |
| pypr_lock_table_write_capacity | Number of write units for the pypr lock table | `number` | `10` | no |
| remote_jobs_table_name | Name of the DynamoDB table for storing remote pipeline runs information | `string` | `"remote-jobs-ikigai"` | no |
| remote_jobs_table_read_capacity | Number of read units for the remote jobs table | `number` | `1` | no |
| remote_jobs_table_write_capacity | Number of write units for the remote jobs table | `number` | `1` | no |

## Outputs

These values will be placed into the environment files in the Ikigai Helm chart during the microservices setup.

| Name | Description |
|------|-------------|
| remote_jobs_table_name | Name of the DynamoDB table for storing remote pipeline runs information |
| facet_templates_table_name | Name of the DynamoDB table for storing facet templates |
| lock_table_name | Name of the DynamoDB table for storing Ikigai component locks |
| connection_table_name | Name of the DynamoDB table for storing websocket connection information |

