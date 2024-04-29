output "pipeline_staging_db_endpoint" {
  value = "postgresql://${var.pipeline_username}:${var.pipeline_password}@${aws_db_instance.pipeline-staging-prod.address}:${var.port}/${aws_db_instance.pipeline-staging-prod.db_name}"
}

output "superset_db_endpoint" {
  value = "postgresql://${var.superset_username}:${var.superset_password}@${aws_db_instance.superset-prod.address}:${var.port}/${aws_db_instance.superset-prod.db_name}"
}

output "service_metadata_db_endpoint" {
  value = "postgresql://${var.service_metadata_username}:${var.service_metadata_password}@${aws_db_instance.service-metadata-prod.address}:${var.port}/${aws_db_instance.service-metadata-prod.db_name}"
}

output "jupyterhub_db_endpoint" {
  value = "postgresql://${var.jupyterhub_username}:${var.jupyterhub_password}@${aws_db_instance.jupyterhub-prod.address}:${var.port}/${aws_db_instance.jupyterhub-prod.db_name}"
}

output "airbyte_db_hostname" {
  value = aws_db_instance.airbyte-prod.address
}

output "airbyte_db_port" {
  value = var.port
}

output "airbyte_db_name" {
  value = aws_db_instance.airbyte-prod.db_name
}

output "airbyte_db_username" {
  value = var.airbyte_username
}

output "airbyte_db_password" {
  value = var.airbyte_password
}

output "dashhub_db_hostname" {
  value = aws_db_instance.dashhub-prod.address
}

output "dashhub_db_port" {
  value = var.port
}

output "dashhub_db_name" {
  value = aws_db_instance.dashhub-prod.db_name
}

output "dashhub_db_username" {
  value = var.dashhub_username
}

output "dashhub_db_password" {
  value = var.dashhub_password
}

output "database_storage_db_hostname" {
  value = aws_db_instance.database-storage-prod.address
}

output "database_storage_db_port" {
  value = var.port
}

output "database_storage_db_name" {
  value = aws_db_instance.database-storage-prod.db_name
}

output "database_storage_db_username" {
  value = var.database_username
}

output "database_storage_db_password" {
  value = var.database_password
}

output "fivetran_db_hostname" {
  value = aws_db_instance.fivetran-connection-prod.address
}

output "fivetran_db_port" {
  value = var.port
}

output "fivetran_db_name" {
  value = aws_db_instance.fivetran-connection-prod.db_name
}

output "fivetran_db_username" {
  value = var.fivetran_username
}

output "fivetran_db_password" {
  value = var.fivetran_password
}