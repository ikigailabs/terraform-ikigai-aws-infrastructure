resource "aws_db_instance" "airbyte-prod" {
  allocated_storage         = var.airbyte_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.airbyte_server_name
  instance_class            = var.airbyte_server_instance
  multi_az                  = true
  db_name                   = "airbyte"
  username                  = var.airbyte_username
  password                  = var.airbyte_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.airbyte_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "dashhub-prod" {
  allocated_storage         = var.dashhub_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.dashhub_server_name
  instance_class            = var.dashhub_server_instance
  multi_az                  = true
  db_name                   = "dashhub"
  username                  = var.dashhub_username
  password                  = var.dashhub_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.airbyte_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "database-storage-prod" {
  allocated_storage         = var.database_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.database_server_name
  instance_class            = var.database_server_instance
  multi_az                  = true
  db_name                   = "database_storage"
  username                  = var.database_username
  password                  = var.database_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.database_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "fivetran-connection-prod" {
  allocated_storage         = var.fivetran_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.fivetran_server_name
  instance_class            = var.fivetran_server_instance
  multi_az                  = true
  db_name                   = "fivetran_connection"
  username                  = var.fivetran_username
  password                  = var.fivetran_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.fivetran_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "jupyterhub-prod" {
  allocated_storage         = var.jupyterhub_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.jupyterhub_server_name
  instance_class            = var.jupyterhub_server_instance
  multi_az                  = true
  db_name                   = "jupyterhub"
  username                  = var.jupyterhub_username
  password                  = var.jupyterhub_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.jupyterhub_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "pipeline-staging-prod" {
  allocated_storage         = var.pipeline_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.pipeline_server_name
  instance_class            = var.pipeline_server_instance
  multi_az                  = true
  db_name                   = "pipeline_data"
  username                  = var.pipeline_username
  password                  = var.pipeline_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.pipeline_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "service-metadata-prod" {
  allocated_storage         = var.service_metadata_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.service_metadata_server_name
  instance_class            = var.service_metadata_server_instance
  multi_az                  = true
  db_name                   = "service_metadata"
  username                  = var.service_metadata_username
  password                  = var.service_metadata_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.service_metadata_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}

resource "aws_db_instance" "superset-prod" {
  allocated_storage         = var.superset_server_storage
  db_subnet_group_name      = aws_db_subnet_group.prod_rds_subnet_group.id
  deletion_protection       = true
  backup_retention_period   = 2
  enabled_cloudwatch_logs_exports = [ "postgresql" , "upgrade"]
  engine                    = "postgres"
  engine_version            = var.engine_version
  identifier                = var.superset_server_name
  instance_class            = var.superset_server_instance
  multi_az                  = true
  db_name                   = "superset"
  username                  = var.superset_username
  password                  = var.superset_password
  port                      = var.port
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = true
  storage_encrypted         = true
  vpc_security_group_ids    = [data.aws_security_group.vpn_security_group.id, data.aws_security_group.vpc_security_group.id]
  tags                      = {
                                "name"    = var.superset_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}