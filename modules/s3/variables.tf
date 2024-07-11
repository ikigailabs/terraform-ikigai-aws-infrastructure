variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "ikigai_logs_bucket_name" {
  description = "Name of S3 bucket for logs"
  type        = string
  default     = "ikigai-logs"
}

variable "ikigai_target_logs_bucket_name" {
  description = "Name of S3 bucket storing logs for logging bucket"
  type        = string
  default     = "ikigai-bucket-logging"
}

variable "ikigai_cold_storage_bucket_name" {
  description = "Name of S3 bucket for cold storage"
  type        = string
  default     = "ikigai-cold-storage"
}

variable "ikigai_connectors_bucket_name" {
  description = "Name of S3 bucket for connectors"
  type        = string
  default     = "ikigai-connectors"
}

variable "ikigai_dataset_bucket_name" {
  description = "Name of S3 bucket for datasets"
  type        = string
  default     = "ikigai-datasets"
}

variable "ikigai_models_bucket_name" {
  description = "Name of S3 bucket for models"
  type        = string
  default     = "ikigai-models"
}

variable "ikigai_sample_datasets_bucket_name" {
  description = "Name of S3 bucket for sample datasets storage"
  type        = string
  default     = "ikigai-sample-datasets"
}

variable "ikigai_temp_bucket_name" {
  description = "Name of S3 bucket for temp storage"
  type        = string
  default     = "ikigai-temp"
}