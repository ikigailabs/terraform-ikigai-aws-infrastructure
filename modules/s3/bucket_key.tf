# default bucket encryption key on 10 day rotation 
resource "aws_kms_key" "s3_bucket_key" {
  description             = "This key is used to encrypt S3 bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true 
}