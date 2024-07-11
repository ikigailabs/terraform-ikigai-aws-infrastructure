resource "aws_kms_key" "prod_dynamo_key" {
  description             = "This key is used to encrypt dynamo db tables"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}