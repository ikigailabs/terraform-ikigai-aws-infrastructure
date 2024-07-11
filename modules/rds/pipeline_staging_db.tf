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
  vpc_security_group_ids    = [var.vpn_security_group_id, var.vpc_security_group_id]
  tags                      = {
                                "name"    = var.pipeline_server_name,
                                "datadog" = "true"
                              }
  copy_tags_to_snapshot     = true
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = aws_iam_role.rds-monitoring-role.arn
}