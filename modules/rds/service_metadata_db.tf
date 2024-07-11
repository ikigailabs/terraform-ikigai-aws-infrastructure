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
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.service_metadata_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}