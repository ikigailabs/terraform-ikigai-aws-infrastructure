variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "connection_table_name" {
  type        = string
  description = "Ikigai connections DynamoDB table name"
  default     = "connections-ikigai"
}

variable "connection_table_read_capacity" {
  type        = number
  description = "Read capacity for Ikigai connections DynamoDB table"
  default     = 50
}

variable "connection_table_write_capacity" {
  type        = number
  description = "Write capacity for Ikigai connections DynamoDB table"
  default     = 2
}

variable "facet_templates_table_name" {
  type        = string
  description = "Ikigai facet templates DynamoDB table name"
  default     = "facet-templates-ikigai"
}

variable "facet_templates_table_read_capacity" {
  type        = number
  description = "Read capacity for Ikigai facet templates DynamoDB table"
  default     = 1
}

variable "facet_templates_table_write_capacity" {
  type        = number
  description = "Write capacity for Ikigai facet templates DynamoDB table"
  default     = 1
}

variable "lock_table_name" {
  type        = string
  description = "Ikigai lock DynamoDB table name"
  default     = "lock-table-ikigai"
}

variable "lock_table_read_capacity" {
  type        = number
  description = "Read capacity for Ikigai lock DynamoDB table"
  default     = 10
}

variable "lock_table_write_capacity" {
  type        = number
  description = "Write capacity for Ikigai lock DynamoDB table"
  default     = 10
}

variable "pypr_lock_table_name" {
  type        = string
  description = "Ikigai pypr lock DynamoDB table name"
  default     = "pypr-locks-ikigai"
}

variable "pypr_lock_table_read_capacity" {
  type        = number
  description = "Read capacity for Ikigai pypr lock DynamoDB table"
  default     = 10
}

variable "pypr_lock_table_write_capacity" {
  type        = number
  description = "Write capacity for Ikigai pypr lock DynamoDB table"
  default     = 10
}

variable "remote_jobs_table_name" {
  type        = string
  description = "Ikigai remote jobs DynamoDB table name"
  default     = "remote-jobs-ikigai"
}

variable "remote_jobs_table_read_capacity" {
  type        = number
  description = "Read capacity for Ikigai remote jobs DynamoDB table"
  default     = 1
}

variable "remote_jobs_table_write_capacity" {
  type        = number
  description = "Write capacity for Ikigai remote jobs DynamoDB table"
  default     = 1
}