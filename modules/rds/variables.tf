variable "aws_region" {
  description = "AWS region"
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
  description = "the name for the airbyte postgres server"
  type        = string
  default     = "airbyte-ikigai"
}

variable "airbyte_server_storage" {
  description = "allocated storage for the airbyte postgres server in gibibytes"
  type        = number
  default     = 20
}

variable "airbyte_server_instance" {
  description = "the hardware associated with the airbyte postgres server"
  type        = string
  default     = "db.t3.small"
}

variable "airbyte_database_name" {
  description = "Name of the database of the airbyte postgres server"
  type        = string
  default     = "airbyte-db"
}

variable "airbyte_username" {
  description = "this is the airbyte postgres server username"
  type        = string
}

variable "airbyte_password" {
  description = "this is the airbyte postgres server password"
  type        = string
}


# database
variable "database_storage_server_name" {
  description = "the name for the database_storage postgres server"
  type        = string
  default     = "database-storage-ikigai"
}

variable "database_storage_server_storage" {
  description = "allocated storage for the database_storage postgres server in gibibytes"
  type        = number
  default     = 20
}

variable "database_storage_server_instance" {
  description = "the hardware associated with the database_storage postgres server"
  type        = string
  default     = "db.t3.small"
}

variable "database_storage_database_name" {
  description = "Name of the database of the database_storage postgres server"
  type        = string
  default     = "database-storage-db"
}

variable "database_storage_server_username" {
  description = "this is the database_storage postgres server username"
  type        = string
}

variable "database_storage_server_password" {
  description = "this is the database_storage postgres server password"
  type        = string
}


# jupyterhub
variable "jupyterhub_server_name" {
  description = "the name for the jupyterhub postgres server"
  type        = string
  default     = "juptyterhub-ikigai"
}

variable "jupyterhub_server_storage" {
  description = "allocated storage for the jupyterhub postgres server in gibibytes"
  type        = number
  default     = 20
}

variable "jupyterhub_server_instance" {
  description = "the hardware associated with the jupyterhub postgres server"
  type        = string
  default     = "db.t3.small"
}

variable "jupyterhub_database_name" {
  description = "Name of the database of the jupyterhub postgres server"
  type        = string
  default     = "jupyterhub-db"
}

variable "jupyterhub_username" {
  description = "this is the jupyterhub postgres server username"
  type        = string
}

variable "jupyterhub_password" {
  description = "this is the jupyterhub postgres server password"
  type        = string
}


# pipeline
variable "pipeline_staging_server_name" {
  description = "the name for the pipeline_staging server"
  type        = string
  default     = "pipeline-staging-ikigai"
}

variable "pipeline_staging_server_storage" {
  description = "allocated storage for the pipeline_staging postgres server in gibibytes"
  type        = number
  default     = 50
}

variable "pipeline_staging_server_instance" {
  description = "the hardware associated with the pipeline_staging postgres server"
  type        = string
  default     = "db.m5.xlarge"
}

variable "pipeline_staging_database_name" {
  description = "Name of the database of the pipeline_staging postgres server"
  type        = string
  default     = "pipeline-staging-db"
}

variable "pipeline_staging_username" {
  description = "this is the pipeline_staging postgres server username"
  type        = string
}

variable "pipeline_staging_password" {
  description = "this is the pipeline_staging postgres server password"
  type        = string
}


# superset
variable "superset_server_name" {
  description = "the name for the pipeline postgres server"
  type        = string
  default     = "superset-ikigai"
}

variable "superset_server_storage" {
  description = "allocated storage for the superset postgres server in gibibytes"
  type        = number
  default     = 20
}

variable "superset_server_instance" {
  description = "the hardware associated with the superset postgres server"
  type        = string
  default     = "db.t3.small"
}

variable "superset_database_name" {
  description = "Name of the database of the superset postgres server"
  type        = string
  default     = "superset-db"
}

variable "superset_username" {
  description = "this is the superset postgres server username"
  type        = string
}

variable "superset_password" {
  description = "this is the superset postgres server password"
  type        = string
}



# service_metadata
variable "service_metadata_server_name" {
  description = "the name for the service_metadata postgres server"
  type        = string
  default     = "service-metadata-ikigai"
}

variable "service_metadata_server_storage" {
  description = "the allocated storage for the service_metadata postgres server in gibibytes"
  type        = number
  default     = 100
}

variable "service_metadata_server_instance" {
  description = "the hardware associated with the service_metadata postgres server"
  type        = string
  default     = "db.m5.large"
}

variable "service_metadata_database_name" {
  description = "Name of the database of the service_metadata postgres server"
  type        = string
  default     = "service-metadata-db"
}

variable "service_metadata_username" {
  description = "this is the service_metadata postgres server username"
  type        = string
}

variable "service_metadata_password" {
  description = "this is the service_metadata postgres server password"
  type        = string
}

# dashhub
variable "dashhub_server_name" {
  description = "the name for the dashhub postgres server"
  type        = string
  default     = "dashhub-ikigai"
}

variable "dashhub_server_storage" {
  description = "the allocated storage for the dashhub postgres server"
  type        = number
  default     = 20
}

variable "dashhub_server_instance" {
  description = "the hardware associated with the dashhub postgres server"
  type        = string
  default     = "db.t3.small"
}

variable "dashhub_database_name" {
  description = "Name of the database of the dashhub postgres server"
  type        = string
  default     = "dashhub-db"
}

variable "dashhub_username" {
  description = "this is the dashhub server postgres username"
  type        = string
}

variable "dashhub_password" {
  description = "this is the dashhub server postgres password"
  type        = string
}