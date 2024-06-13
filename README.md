# terraform-ikigai-aws-infrastructure
The submodules create all of the AWS infrastructure necessary to launch the Ikigai application.

The following IAM permission policy must be attached to the user/role that will be assumed when deploying the remaining Ikigai Infrastructure using terraform.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:*",
                "es:*",
                "cognito-identity:*",
                "rds:*",
                "logs:*",
                "s3:*",
                "kms:*",
                "dynamodb:*",
                "ec2:*",
                "cognito-idp:*",
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}
```