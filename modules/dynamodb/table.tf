resource "aws_dynamodb_table" "connections-prod" {
  name           = var.connection_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.connection_table_read_capacity
  write_capacity = var.connection_table_write_capacity
  hash_key       = "component_id"
  range_key      = "connection_id"
  
  attribute {
    name = "component_id"
    type = "S"
  }

  attribute {
    name = "connection_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "facet-templates-prod" {
  name           = var.facet_templates_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.facet_templates_table_read_capacity
  write_capacity = var.facet_templates_table_write_capacity
  hash_key       = "TEMPLATE_ID"

  attribute {
    name = "TEMPLATE_ID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "lock-table-prod" {
  name           = var.lock_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "lock_key"
  range_key      = "sort_key"

  attribute {
    name = "lock_key"
    type = "S"
  }

  attribute {
    name = "sort_key"
    type = "S"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }
}

resource "aws_dynamodb_table" "pypr-locks-prod" {
  name           = var.pypr_lock_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.pypr_lock_table_read_capacity
  write_capacity = var.pypr_lock_table_write_capacity
  hash_key       = "lock_key"
  range_key      = "sort_key"

  attribute {
    name = "lock_key"
    type = "S"
  }

  attribute {
    name = "sort_key"
    type = "S"
  }
}

resource "aws_dynamodb_table" "remote-jobs-prod" {
  name           = var.remote_jobs_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.remote_jobs_table_read_capacity
  write_capacity = var.remote_jobs_table_write_capacity
  hash_key       = "component_id"

  attribute {
    name = "component_id"
    type = "S"
  }
}