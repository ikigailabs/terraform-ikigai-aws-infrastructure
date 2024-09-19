resource "aws_iam_role" "node_instance_role" {
  name = "NodeInstanceIAMRole"

  assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "EKSClusterAssumeRole",
                "Effect": "Allow",
                "Principal": {
                    "AWS": [
                        var.trusted_iam_role
                    ]
                },
                "Action": "sts:AssumeRole"
            }
        ]
    })

  inline_policy {
      name = "NodeInstanceIAMRoleTrustPolicy"
      policy = jsonencode({
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "VisualEditor0",
                    "Effect": "Allow",
                    "Action": [
                        "cloudwatch:PutMetricData",
                        "rds:*",
                        "cloudwatch:DeleteAlarms",
                        "osis:UntagResource",
                        "kinesis:ListStreams",
                        "osis:GetPipelineChangeProgress",
                        "resource-groups:GetGroup",
                        "kinesis:DescribeStreamSummary",
                        "cloudwatch:DescribeAlarmsForMetric",
                        "ec2:DescribeVolumes",
                        "ecr:BatchCheckLayerAvailability",
                        "ecr:GetLifecyclePolicy",
                        "cloudtrail:LookupEvents",
                        "osis:StartPipeline",
                        "osis:CreatePipeline",
                        "ecr:DescribeImageScanFindings",
                        "apigateway:*",
                        "cloudwatch:GetInsightRuleReport",
                        "ecr:GetDownloadUrlForLayer",
                        "ec2messages:AcknowledgeMessage",
                        "ecr:GetAuthorizationToken",
                        "osis:GetPipelineBlueprint",
                        "cloudwatch:GetMetricStatistics",
                        "iam:*",
                        "resource-groups:CreateGroup",
                        "appconfig:*",
                        "ecr:BatchGetImage",
                        "ecr:DescribeImages",
                        "cloudwatch:DescribeAlarms",
                        "ec2:*",
                        "ec2messages:SendReply",
                        "resource-groups:ListGroupResources",
                        "osis:ValidatePipeline",
                        "organizations:*",
                        "resource-groups:GetGroupQuery",
                        "tag:GetResources",
                        "ec2messages:GetEndpoint",
                        "cloudwatch:GetMetricData",
                        "osis:ListPipelineBlueprints",
                        "ec2messages:GetMessages",
                        "ecr:ListTagsForResource",
                        "ecr:ListImages",
                        "cloudwatch:ListMetrics",
                        "ec2messages:DeleteMessage",
                        "cloudwatch:DescribeAlarmHistory",
                        "ec2messages:FailMessage",
                        "kms:*",
                        "ecr:DescribeRepositories",
                        "osis:UpdatePipeline",
                        "s3:*",
                        "ecr:GetLifecyclePolicyPreview",
                        "ec2:DescribeTags",
                        "osis:ListPipelines",
                        "kinesis:DescribeStream",
                        "resource-groups:ListGroups",
                        "osis:TagResource",
                        "resource-groups:DeleteGroup",
                        "cloudwatch:PutMetricAlarm",
                        "osis:DeletePipeline",
                        "osis:GetPipeline",
                        "ecr:*",
                        "osis:ListTagsForResource",
                        "osis:StopPipeline",
                        "ecr:GetRepositoryPolicy"
                    ],
                    "Resource": "*"
                }
            ]
        })
  }
}