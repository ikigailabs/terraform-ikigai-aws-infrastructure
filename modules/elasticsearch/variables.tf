variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "private_subnet_1_id" {
  description = "ID of the first private VPC subnet"
  type        = string
}

variable "private_subnet_2_id" {
  description = "ID of the second private VPC subnet"
  type        = string
}

variable "vpc_security_group_id" {
  type        = string
  description = "ID of VPC security group which allows intra-VPC traffic"
}

variable "vpn_security_group_id" {
  type        = string
  description = "ID of VPC security group which allows VPN traffic"
}

variable "component_logs_name" {
  type        = string
  description = "name of Ikigai component logs elasticsearch instance"
  default     = "component-logs-ikigai"
}

variable "component_logs_version" {
  type        = string
  description = "version of Ikigai component logs elasticsearch instance"
  default     = "7.1"
}

variable "component_logs_instance_count" {
  type        = number
  description = "number of instances for Ikigai component logs elasticsearch instance"
  default     = 2
}

variable "component_logs_instance_type" {
  type        = string
  description = "instance type for Ikigai component logs elasticsearch instance"
  default     = "m5.large.elasticsearch"
}

variable "component_logs_master_count" {
  type        = number
  description = "number of master instances for Ikigai component logs elasticsearch instance"
  default     = 1
}

variable "component_logs_master_type" {
  type        = string
  description = "master instance type for Ikigai component logs elasticsearch instance"
  default     = "r5.large.elasticsearch"
}

variable "component_logs_warm_count" {
  type        = number
  description = "number of warm instances for Ikigai component logs elasticsearch instance"
  default     = 2
}

variable "component_logs_warm_type" {
  type        = string
  description = "warm instance type for Ikigai component logs elasticsearch instance"
  default     = "ultrawarm1.medium.elasticsearch"
}

variable "component_logs_username" {
  type        = string
  description = "Master username for Ikigai component logs elasticsearch instance"
}

variable "component_logs_password" {
  type        = string
  description = "Master password for Ikigai component logs elasticsearch instance"
}

variable "component_logs_ebs_volume_size" {
  type        = number
  description = "Volume size of EBS for Ikigai component logs elasticsearch instance"
  default     = 20
}

variable "component_logs_ebs_throughput" {
  type        = number
  description = "Throughput of EBS for Ikigai component logs elasticsearch instance"
  default     = 125
}

variable "component_logs_ebs_iops" {
  type        = number
  description = "Baseline input/output performance of EBS for Ikigai component logs elasticsearch instance"
  default     = 3000
}

variable "monitor_elasticsearch_name" {
  type        = string
  description = "name of Ikigai monitoring elasticsearch instance"
  default     = "monitor-ikigai"
}

variable "monitor_elasticsearch_version" {
  type        = string
  description = "version of Ikigai monitoring elasticsearch instance"
  default     = "7.1"
}

variable "monitor_instance_count" {
  type        = number
  description = "number of instances for Ikigai monitoring elasticsearch instance"
  default     = 2
}

variable "monitor_instance_type" {
  type        = string
  description = "instance type for Ikigai monitoring elasticsearch instance"
  default     = "m5.large.elasticsearch"
}

variable "monitor_username" {
  type        = string
  description = "Master username for Ikigai monitoring elasticsearch instance"
}

variable "monitor_password" {
  type        = string
  description = "Master password for Ikigai monitoring elasticsearch instance"
}

variable "monitor_ebs_volume_size" {
  type        = number
  description = "Volume size of EBS for Ikigai monitoring elasticsearch instance"
  default     = 20
}