resource "aws_cloudwatch_log_group" "component-logs-cwloggroup" {
  name = "elasticsearch-component-logs-cloudwatch-log"
}

resource "aws_cloudwatch_log_group" "monitoring-cwloggroup" {
  name = "elasticsearchh-monitoring-cloudwatch-log"
}

resource "aws_cloudwatch_log_resource_policy" "cwlogresourcepolicy" {
  policy_name     = "elasticsearch-cloudwatch-log-policy"
  policy_document = <<CONFIG
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "es.amazonaws.com"
        },
        "Action": [
            "logs:PutLogEvents",
            "logs:PutLogEventsBatch",
            "logs:CreateLogStream"
        ],
        "Resource": "arn:aws:logs:*"
        }
    ]
    }
  CONFIG
}
