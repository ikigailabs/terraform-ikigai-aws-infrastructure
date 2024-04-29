variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC that the EKS cluster will live in"
  type        = string
  default     = "ikigai-vpc"
}

variable "eks_subnet_name_1" {
  description = "Name of the first private VPC subnet"
  type        = string
  default     = "private-1"
}

variable "eks_subnet_name_2" {
  description = "Name of the second private VPC subnet"
  type        = string
  default     = "private-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "prod-cluster"
}

variable "kubernetes_version" {
  description = "the version of kubernetes the cluster will be running"
  type        = string
  default     = 1.27
}

variable "ami_type" {
  description = "the ami used for nodes in the Kubernetes cluster"
  type        = string
  default     = "AL2_x86_64"
}

variable "pipeline_ng_name" {
  description = "Name of the pipeline node group"
  type        = string
  default     = "pipeline-nodegroup"
}

variable "pipeline_ng_min_size" {
  description = "The minimum size of the pipeline node group"
  type        = number
  default     = 6
}

variable "pipeline_ng_max_size" {
  description = "The maximum size of the pipeline node group"
  type        = number
  default     = 6
}

variable "pipeline_ng_desired_size" {
  description = "The desired size of the pipeline node group"
  type        = number
  default     = 6
}

variable "pipeline_ng_instance_type" {
  description = "The instance type of the pipeline node group"
  type        = string
  default     = "r5.4xlarge"
}

variable "service_ng_name" {
  description = "Name of the pipeline node group"
  type        = string
  default     = "service-nodegroup"
}

variable "service_ng_min_size" {
  description = "The minimum size of the service node group"
  type        = number
  default     = 5
}

variable "service_ng_max_size" {
  description = "The maximum size of the service node group"
  type        = number
  default     = 5
}

variable "service_ng_desired_size" {
  description = "The desired size of the service node group"
  type        = number
  default     = 5
}

variable "service_ng_instance_type" {
  description = "The instance type of the service node group"
  type        = string
  default     = "c5.12xlarge"
}

variable "use_node_instance_role" {
  description = "Flag to determine if node group will have an custom IAM role"
  type        = bool
  default     = true
}

