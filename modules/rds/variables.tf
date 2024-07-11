variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC that the EKS cluster will live in"
  type        = string
}

variable "rds_subnet_1_id" {
  description = "ID of the first rds VPC subnet"
  type        = string
}

variable "rds_subnet_2_id" {
  description = "ID of the second rds VPC subnet"
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

variable "port" {
  description = "the port which the db endpoint is open on"
  type        = number
  default     = 5432
}

variable "parameter_group_name" {
  description = "the parameter group for the db's"
  type        = string
  default     = "default.postgres12"
}

variable "monitoring_interval" {
  description = "the monitoring interval for the db's"
  type        = number
  default     = 60
}

variable "engine_version" {
  description = "postgres engine version"
  type        = string
  default     = "12.17"
}


# airbyte
variable "airbyte_server_name" {
  description = "the name for the airbyte server"
  type        = string
  default     = "airbyte-ikigai"
}

variable "airbyte_server_storage" {
  description = "allocated storage for the airbyte server in gibibytes"
  type        = number
  default     = 20
}

variable "airbyte_server_instance" {
  description = "the hardware associated with the airbyte server"
  type        = string
  default     = "db.t3.small"
}

variable "airbyte_username" {
  description = "this is the airbyte server username"
  type        = string
}

variable "airbyte_password" {
  description = "this is the airbyte server password"
  type        = string
}


# database
variable "database_server_name" {
  description = "the name for the database server"
  type        = string
  default     = "database-storage-ikigai"
}

variable "database_server_storage" {
  description = "allocated storage for the database storage server in gibibytes"
  type        = number
  default     = 20
}

variable "database_server_instance" {
  description = "the hardware associated with the database server"
  type        = string
  default     = "db.t3.small"
}

variable "database_username" {
  description = "this is the database server username"
  type        = string
}

variable "database_password" {
  description = "this is the database server password"
  type        = string
}


# jupyterhub
variable "jupyterhub_server_name" {
  description = "allocated storage for the airbyte server in gibibytes"
  type        = string
  default     = "juptyterhub-ikigai"
}

variable "jupyterhub_server_storage" {
  description = "the name for the jupyterhub server"
  type        = number
  default     = 20
}

variable "jupyterhub_server_instance" {
  description = "the hardware associated with the jupyterhub server"
  type        = string
  default     = "db.t3.small"
}

variable "jupyterhub_username" {
  description = "this is the jupyterhub server username"
  type        = string
}

variable "jupyterhub_password" {
  description = "this is the jupyterhub server password"
  type        = string
}


# pipeline
variable "pipeline_server_name" {
  description = "the name for the pipeline server"
  type        = string
  default     = "pipeline-staging-ikigai"
}

variable "pipeline_server_storage" {
  description = "allocated storage for the pipeline_staging server in gibibytes"
  type        = number
  default     = 50
}

variable "pipeline_server_instance" {
  description = "the hardware associated with the pipeline server"
  type        = string
  default     = "db.m5.xlarge"
}

variable "pipeline_username" {
  description = "this is the pipeline server username"
  type        = string
}

variable "pipeline_password" {
  description = "this is the jupyterhub server password"
  type        = string
}


# superset
variable "superset_server_name" {
  description = "the name for the pipeline server"
  type        = string
  default     = "superset-ikigai"
}

variable "superset_server_storage" {
  description = "allocated storage for the superset server in gibibytes"
  type        = number
  default     = 20
}

variable "superset_server_instance" {
  description = "the hardware associated with the superset server"
  type        = string
  default     = "db.t3.small"
}

variable "superset_username" {
  description = "this is the superset server username"
  type        = string
}

variable "superset_password" {
  description = "this is the superset server password"
  type        = string
}


# service_metadata
variable "service_metadata_server_name" {
  description = "the name for the service_metadata server"
  type        = string
  default     = "service-metadata-ikigai"
}

variable "service_metadata_server_storage" {
  description = "the allocated storage for the service_metadata server in gibibytes"
  type        = number
  default     = 100
}

variable "service_metadata_server_instance" {
  description = "the hardware associated with the service_metadata server"
  type        = string
  default     = "db.t2.small"
}

variable "service_metadata_username" {
  description = "this is the service_metadata server username"
  type        = string
}

variable "service_metadata_password" {
  description = "this is the service_metadata server password"
  type        = string
}


# dashhub
variable "dashhub_server_name" {
  description = "the name for the dashhub server"
  type        = string
  default     = "dashhub-ikigai"
}

variable "dashhub_server_storage" {
  description = "the allocated storage for the dashhub server"
  type        = number
  default     = 20
}

variable "dashhub_server_instance" {
  description = "the hardware associated with the dashhub server"
  type        = string
  default     = "db.t3.small"
}

variable "dashhub_username" {
  description = "this is the dashhub server username"
  type        = string
}

variable "dashhub_password" {
  description = "this is the dashhub server password"
  type        = string
}