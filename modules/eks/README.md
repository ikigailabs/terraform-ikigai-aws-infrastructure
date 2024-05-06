# Ikigai Elastic Kubernetes Service Terraform Module

This module deploys the AWS Elastic Kubernetes Service infrastructure required for an Ikigai application setup.

## Usage

To use the EKS module, the ids of a VPC and two of its private subnets are needed as input. This can be done using the outputs of the Ikigai VPC module, or by creating data sources that link to an existing vpc and subnets.

This is an example using the EKS module with the Ikigai VPC module outputs.

```hcl
module "aws-infrastructure_vpc" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/vpc"
  version = "~> 0.0"
  
  aws_region = "us-east-2"
  availability_zone_1 = "us-east-2a"
  availability_zone_2 = "us-east-2b"
}

module "aws-infrastructure_eks" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/eks"
  version = "~> 0.0"
  
  aws_region = module.aws-infrastructure_vpc.vpc_region
  vpc_id = module.aws-infrastructure_vpc.vpc_id
  private_subnet_1_id = module.aws-infrastructure_vpc.private_subnet_1_id
  private_subnet_2_id = module.aws-infrastructure_vpc.private_subnet_2_id
}
```

This is an example using the EKS module with an existing VPC and subnets

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
  cidr_block = "16.0.32.0/19"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "private-subnet-1"
  }
}

data "aws_subnet" "private_subnet_2" {
  cidr_block = "16.0.64.0/19"
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    "Name" = "private-subnet-2"
  }
}

# Create the EKS infrastructure
module "aws-infrastructure_eks" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/eks"
  version = "~> 0.0"
  
  aws_region = data.aws_region.current
  vpc_id = data.aws_vpc.existing_vpc.id
  private_subnet_1_id = data.aws_subnet.private_subnet_1.id
  private_subnet_2_id = data.aws_subnet.private_subnet_2.id
}
```

It is possible to further customize the deployment using the variables listed below.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region that the EKS infrastructure will be deployed in | `string` | n/a | yes |
| private_subnet_1_id | Id of the first of two private subnets | `string` | n/a | yes |
| private_subnet_2_id | Id of the second of two private subnets | `string` | n/a | yes |
| vpc_id | Id of the VPC that the EKS deployment will exist in | `string` | n/a | yes |
| ami_type | The AMI used for nodes in the Kubernetes cluster | `string` | `"AL2_x86_64"` | no |
| cluster_name | Name of the EKS cluster to be created | `string` | `"ikigai-cluster"` | no |
| kubernetes_version | The version of Kubernetes the cluster will be running |`string` | `"1.27"` | no |
| pipeline_ng_desired_size | The desired size of the pipeline node group | `number` | `6` | no |
| pipeline_ng_instance_type | The instance type of the pipeline node group | `string` | `"r5.4xlarge"` | no |
| pipeline_ng_max_size | The maximum size of the pipeline node group | `number` | `6` | no |
| pipeline_ng_min_size | The minimum size of the pipeline node group | `number` | `6` | no |
| pipeline_ng_name | Name of the pipeline node group | `string` | `"pipeline-nodegroup"` | no |
| service_ng_desired_size | The desired size of the service node group | `number` | `5` | no |
| service_ng_instance_type | The instance type of the service node group | `string` | `"c5.12xlarge"` | no |
| service_ng_max_size | The maximum size of the service node group | `number` | `5` | no |
| service_ng_min_size | The minimum size of the service node group | `number` | `5` | no |
| service_ng_name | Name of the pipeline node group | `string` | `"service-nodegroup"` | no |
| use_node_instance_role | Flag to determine if node group will have an custom IAM role | `bool` | `true` | no |

## Outputs

There are no outputs for this module