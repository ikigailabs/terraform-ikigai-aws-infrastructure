# Ikigai S3 Terraform Module

This module allows you to create the AWS S3 infrastructure necessary for an Ikigai application setup.

## Usage

A simple usage example of the Ikigai S3 module, only setting the required variables, would be:

```hcl
module "aws-infrastructure_s3" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/s3"
  version = "0.0.4"
  
  aws_region = "us-east-2"
}
```

It is possible to further customize the deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region that the DynamoDB infrastructure will be deployed in | `string` | n/a | yes |
| anyscale_bucket_name | Name of the S3 bucket for anyscale logs | `string` | `"ikigai-anyscale"` | no |
| ikigai_cold_storage_bucket_name | Name of the S3 bucket for cold storage | `string` | `"ikigai-cold-storage"` | no |
| ikigai_connectors_bucket_name | Name of the S3 bucket for connectors | `string` | `"ikigai-connectors"` | no |
| ikigai_dataset_bucket_name | Name of the S3 bucket for dataset storage | `string` | `"ikigai-datasets"` | no |
| ikigai_logs_bucket_name | Name of the S3 bucket for storing logs from other buckets | `string` | `"ikigai-logs"` | no |
| ikigai_models_bucket_name | Name of the S3 bucket for model storage | `string` | `"ikigai-models"` | no |
| ikigai_sample_datasets_bucket_name | Name of the S3 bucket for sample datasets storage | `string` | `"ikigai-sample-datasets"` | no |
| ikigai_target_logs_bucket_name | Name of the S3 bucket for storing logs of the logging bucket | `string` | `"ikigai-bucket-logging"` | no |
| ikigai_temp_bucket_name | Name of the S3 bucket for temporary storage | `string` | `"ikigai-temp"` | no |

## Outputs

These values will be placed into the environment files in the Ikigai Helm chart during the microservices setup.

| Name | Description |
|------|-------------|
| cold-storage-bucket-name | Name of the S3 bucket for cold storage |
| connector-bucket-name | Name of the S3 bucket for connectors |
| dataset-bucket-name | Name of the S3 bucket for dataset storage |
| model-bucket-name | Name of the S3 bucket for model storage |
| sample-dataset-bucket-name | Name of the S3 bucket for sample datasets storage |
| temp-bucket-name | Name of the S3 bucket for temporary storage |