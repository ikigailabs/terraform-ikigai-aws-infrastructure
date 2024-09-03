resource "aws_db_instance" "airbyte-prod" {
  allocated_storage         = var.airbyte_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.airbyte_server_name
  instance_class            = var.airbyte_server_instance
  multi_az                  = true
  db_name                   = var.airbyte_database_name
  username                  = var.airbyte_username
  password                  = var.airbyte_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.airbyte_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "dashhub-prod" {
  allocated_storage         = var.dashhub_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.dashhub_server_name
  instance_class            = var.dashhub_server_instance
  multi_az                  = true
  db_name                   = var.dashhub_database_name
  username                  = var.dashhub_username
  password                  = var.dashhub_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.airbyte_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "database-storage-prod" {
  allocated_storage         = var.database_storage_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.database_storage_server_name
  instance_class            = var.database_storage_server_instance
  multi_az                  = true
  db_name                   = var.database_storage_database_name
  username                  = var.database_storage_server_username
  password                  = var.database_storage_server_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.database_storage_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "jupyterhub-prod" {
  allocated_storage         = var.jupyterhub_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.jupyterhub_server_name
  instance_class            = var.jupyterhub_server_instance
  multi_az                  = true
  db_name                   = var.jupyterhub_database_name
  username                  = var.jupyterhub_username
  password                  = var.jupyterhub_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.jupyterhub_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "pipeline-staging-prod" {
  allocated_storage         = var.pipeline_staging_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.pipeline_staging_server_name
  instance_class            = var.pipeline_staging_server_instance
  multi_az                  = true
  db_name                   = var.pipeline_staging_database_name
  username                  = var.pipeline_staging_username
  password                  = var.pipeline_staging_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.pipeline_staging_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "service-metadata-prod" {
  allocated_storage         = var.service_metadata_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.service_metadata_server_name
  instance_class            = var.service_metadata_server_instance
  multi_az                  = true
  db_name                   = var.service_metadata_database_name
  username                  = var.service_metadata_username
  password                  = var.service_metadata_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.service_metadata_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}

resource "aws_db_instance" "superset-prod" {
  allocated_storage         = var.superset_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = false
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.superset_server_name
  instance_class            = var.superset_server_instance
  multi_az                  = true
  db_name                   = var.superset_database_name
  username                  = var.superset_username
  password                  = var.superset_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.superset_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds_monitoring_role.arn
}
