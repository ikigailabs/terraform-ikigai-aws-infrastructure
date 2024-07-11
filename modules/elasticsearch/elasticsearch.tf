resource "aws_elasticsearch_domain" "component-logs-elasticsearch" {
  domain_name           = var.component_logs_name
  elasticsearch_version = var.component_logs_version

  node_to_node_encryption {
    enabled = true
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = aws_kms_key.prod_elasticsearch_key.arn 
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.component-logs-cwloggroup.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }
  
  cluster_config {
    instance_count           = var.component_logs_instance_count
    instance_type            = var.component_logs_instance_type
    dedicated_master_enabled = true
    dedicated_master_count   = var.component_logs_master_count
    dedicated_master_type    = var.component_logs_master_type
    warm_enabled             = true
    warm_count               = var.component_logs_warm_count
    warm_type                = var.component_logs_warm_type
    zone_awareness_enabled   = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = var.component_logs_username
      master_user_password = var.component_logs_password
    }
  }

  vpc_options {    
    subnet_ids  = [var.private_subnet_1_id, var.private_subnet_2_id]
    security_group_ids = [var.vpc_security_group_id, var.vpn_security_group_id]
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp3"
    volume_size = var.component_logs_ebs_volume_size
    iops        = var.component_logs_ebs_iops
    throughput  = var.component_logs_ebs_throughput
  }

  access_policies = <<CONFIG
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${var.aws_region}:${data.aws_caller_identity.current.account_id}:domain/component-logs/*"
        }
    ]
  }
  CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 0
  }
}

resource "aws_elasticsearch_domain" "monitoring-elasticsearch" {
  domain_name           = var.monitor_elasticsearch_name
  elasticsearch_version = var.monitor_elasticsearch_version

  node_to_node_encryption {
    enabled = true
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = aws_kms_key.prod_elasticsearch_key.arn 
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.monitoring-cwloggroup.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }
  
  cluster_config {
    instance_count         = var.monitor_instance_count
    instance_type          = var.monitor_instance_type
    zone_awareness_enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = var.monitor_username
      master_user_password = var.monitor_password
    }
  }

  vpc_options {    
    subnet_ids  = [var.private_subnet_1_id,var.private_subnet_2_id]
    security_group_ids = [var.vpc_security_group_id, var.vpn_security_group_id]
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 20
  }

  access_policies = <<CONFIG
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${var.aws_region}:${data.aws_caller_identity.current.account_id}:domain/monitoring/*"
        }
    ]
  }
  CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 0
  }
}