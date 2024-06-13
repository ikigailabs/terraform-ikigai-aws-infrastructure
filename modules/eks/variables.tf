variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC that the EKS cluster will live in"
  type        = string
}

variable "private_subnet_1_id" {
  description = "ID of the first private VPC subnet"
  type        = string
}

variable "private_subnet_2_id" {
  description = "ID of the second private VPC subnet"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "ikigai-cluster"
}

variable "kubernetes_version" {
  description = "the version of kubernetes the cluster will be running"
  type        = string
  default     = "1.27"
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

variable "pipeline_ng_disk_size" {
  description = "The disk size of the pipeline node group (in GiB)"
  type        = number
  default     = 200
}

variable "pipeline_ng_volume_type" {
  description = "The ebs volume type of the pipeline node group"
  type        = string
  default     = "gp3"
}

variable "pipeline_ng_ebs_iops" {
  description = "The ebs iops of the pipeline node group"
  type        = number
  default     = 3000
}

variable "pipeline_ng_ebs_throughput" {
  description = "The ebs throughput of the pipeline node group"
  type        = number
  default     = 125
}

variable "pipeline_ng_ebs_encrypted" {
  description = "Whether ebs storage of the pipeline node group is encrypted"
  type        = bool
  default     = true
}

variable "pipeline_ng_ebs_delete_on_termination" {
  description = "Whether ebs storage of the pipeline node group is deleted on termination"
  type        = bool
  default     = true
}

variable "service_ng_name" {
  description = "Name of the service node group"
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

variable "service_ng_disk_size" {
  description = "The disk size of the service node group (in GiB)"
  type        = number
  default     = 200
}

variable "service_ng_volume_type" {
  description = "The ebs volume type of the service node group"
  type        = string
  default     = "gp3"
}

variable "service_ng_ebs_iops" {
  description = "The ebs iops of the service node group"
  type        = number
  default     = 3000
}

variable "service_ng_ebs_throughput" {
  description = "The ebs throughput of the service node group"
  type        = number
  default     = 125
}

variable "service_ng_ebs_encrypted" {
  description = "Whether ebs storage of the service node group is encrypted"
  type        = bool
  default     = true
}

variable "service_ng_ebs_delete_on_termination" {
  description = "Whether ebs storage of the service node group is deleted on termination"
  type        = bool
  default     = true
}

variable "dremio_ng_name" {
  description = "Name of the dremio node group"
  type        = string
  default     = "dremio-nodegroup"
}

variable "dremio_ng_min_size" {
  description = "The minimum size of the dremio node group"
  type        = number
  default     = 4
}

variable "dremio_ng_max_size" {
  description = "The maximum size of the dremio node group"
  type        = number
  default     = 4
}

variable "dremio_ng_desired_size" {
  description = "The desired size of the dremio node group"
  type        = number
  default     = 4
}

variable "dremio_ng_instance_type" {
  description = "The instance type of the dremio node group"
  type        = string
  default     = "r5d.4xlarge"
}

variable "dremio_ng_disk_size" {
  description = "The disk size of the dremio node group (in GiB)"
  type        = number
  default     = 200
}

variable "dremio_ng_volume_type" {
  description = "The ebs volume type of the dremio node group"
  type        = string
  default     = "gp3"
}

variable "dremio_ng_ebs_iops" {
  description = "The ebs iops of the dremio node group"
  type        = number
  default     = 3000
}

variable "dremio_ng_ebs_throughput" {
  description = "The ebs throughput of the dremio node group"
  type        = number
  default     = 125
}

variable "dremio_ng_ebs_encrypted" {
  description = "Whether ebs storage of the dremio node group is encrypted"
  type        = bool
  default     = true
}

variable "dremio_ng_ebs_delete_on_termination" {
  description = "Whether ebs storage of the dremio node group is deleted on termination"
  type        = bool
  default     = true
}

variable "use_node_instance_role" {
  description = "Flag to determine if node group will have an custom IAM role"
  type        = bool
  default     = true
}

