output "pipeline_staging_server_hostname" {
  value = aws_db_instance.pipeline-staging-prod.address
}

output "superset_server_hostname" {
  value = aws_db_instance.superset-prod.address
}

output "service_metadata_server_endpoint" {
  value = aws_db_instance.service-metadata-prod.address
}

output "jupyterhub_server_endpoint" {
  value = aws_db_instance.jupyterhub-prod.address
}

output "airbyte_server_hostname" {
  value = aws_db_instance.airbyte-prod.address
}

output "dashhub_server_hostname" {
  value = aws_db_instance.dashhub-prod.address
}

output "database_storage_server_hostname" {
  value = aws_db_instance.database-storage-prod.address
}