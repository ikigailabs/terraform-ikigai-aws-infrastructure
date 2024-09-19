# Ikigai Elastic Kubernetes Service Terraform Module

This module deploys the AWS Elastic Kubernetes Service infrastructure required for an Ikigai application setup.

## Usage

To use the EKS module, the ids of a VPC and two of its private subnets are needed as input. Pass them in using data sources that link to the existing vpc and its subnets.

This is a simple example usage of the EKS module, only setting the required inputs:

```hcl
module "aws-infrastructure_eks" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/eks"
  version = "~> 1.0"
  
  aws_region = module.aws-infrastructure_vpc.vpc_region
  vpc_id = data.aws_vpc.ikigai_vpc.id
  private_subnet_1_id = data.aws_subnet.private_subnet_1.id
  private_subnet_2_id = data.aws_subnet.private_subnet_2.id
}
```

It is possible to further customize the deployment using the inputs listed below. To do so, add `[input name] = target_value` within the module braces.
For example, to set the `cluster_name` input to `my-cluster`, add `cluster_name = "my-cluster"` to the module block. Remember to add double quotes for string inputs! 

## Inputs

| Name                              | Description                                                                       | Type | Default                | Required |
|-----------------------------------|-----------------------------------------------------------------------------------|------|------------------------|:--------:|
| aws_region                        | The AWS region that the EKS infrastructure will be deployed in                    | `string` | n/a                    | yes |
| private_subnet_1_id               | Id of the first of two private subnets                                            | `string` | n/a                    | yes |
| private_subnet_2_id               | Id of the second of two private subnets                                           | `string` | n/a                    | yes |
| vpc_id                            | Id of the VPC that the EKS deployment will exist in                               | `string` | n/a                    | yes |
| ami_type                          | The AMI used for nodes in the Kubernetes cluster                                  | `string` | `"AL2_x86_64"`         | no |
| cluster_name                      | Name of the EKS cluster to be created                                             | `string` | `"ikigai-cluster"`     | no |
| kubernetes_version                | The version of Kubernetes the cluster will be running                             |`string` | `"1.27"`               | no |
| pipeline_ng_desired_size          | The desired size of the pipeline node group                                       | `number` | `6`                    | no |
| pipeline_ng_instance_type         | The instance type of the pipeline node group                                      | `string` | `"r5.4xlarge"`         | no |
| pipeline_ng_max_size              | The maximum size of the pipeline node group                                       | `number` | `6`                    | no |
| pipeline_ng_min_size              | The minimum size of the pipeline node group                                       | `number` | `6`                    | no |
| pipeline_ng_name                  | Name of the pipeline node group                                                   | `string` | `"pipeline-nodegroup"` | no |
| service_ng_desired_size           | The desired size of the service node group                                        | `number` | `5`                    | no |
| service_ng_instance_type          | The instance type of the service node group                                       | `string` | `"c5.12xlarge"`        | no |
| service_ng_max_size               | The maximum size of the service node group                                        | `number` | `5`                    | no |
| service_ng_min_size               | The minimum size of the service node group                                        | `number` | `5`                    | no |
| service_ng_name                   | Name of the pipeline node group                                                   | `string` | `"service-nodegroup"`  | no |
| use_node_instance_role            | Flag to determine if node group will have an custom IAM role                      | `bool` | `true`                 | no |
| enable_creator_admin_permissions | Enable the aws account used to launch the cluster to be granted admin permissions | `bool` | `false`                | no |
## Outputs

There are no outputs for this module