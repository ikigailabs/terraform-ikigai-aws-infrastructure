# Create a S3 bucket to collect logs from other S3 buckets
resource "aws_s3_bucket" "bucket-logging-v1-prod" {
  bucket = var.ikigai_target_logs_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "bucket-logging-ownership-controls" {
  bucket = aws_s3_bucket.bucket-logging-v1-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "bucket-logging-acl" {
  bucket = aws_s3_bucket.bucket-logging-v1-prod.id
  acl    = "log-delivery-write"

  depends_on = [aws_s3_bucket_ownership_controls.bucket-logging-ownership-controls]
}

# Restrict public access to the bucket
resource "aws_s3_bucket_public_access_block" "bucket-logging-public-access-block" {
  bucket = aws_s3_bucket.bucket-logging-v1-prod.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

# Send logs from the bucket-logging-v1-prod bucket to itself
resource "aws_s3_bucket_logging" "bucket-logging-logging" {
  bucket        = aws_s3_bucket.bucket-logging-v1-prod.id
  target_bucket = "bucket-logging-v1-prod"
  target_prefix = ""
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "bucket-logging-versioning" {
  bucket = aws_s3_bucket.bucket-logging-v1-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-logging-encryption" {
  bucket = aws_s3_bucket.bucket-logging-v1-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}