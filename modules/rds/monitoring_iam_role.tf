data "aws_iam_policy" "rds-monitoring-policy" {
  name = "AmazonRDSEnhancedMonitoringRole"
}

resource "aws_iam_role" "rds-monitoring-role" {
  name = "rds_monitorng_role"
  assume_role_policy = data.aws_iam_policy.rds-monitoring-policy.policy
}