# Log bucket for S3 
resource "aws_s3_bucket" "ikigai-prod-logs" {
  bucket = var.ikigai_logs_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-logs-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-prod-logs.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-logs-acl" {
  bucket = aws_s3_bucket.ikigai-prod-logs.id
  acl    = "log-delivery-write"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-logs-ownership-controls]
}

# Restrict public access to the bucket
resource "aws_s3_bucket_public_access_block" "ikigai-logs-public-access-block" {
  bucket = aws_s3_bucket.ikigai-prod-logs.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

# Send logs from the ikigai-prod-logs bucket to bucket-logging-v1-prod
resource "aws_s3_bucket_logging" "ikigai-logs-logging" {
  bucket        = aws_s3_bucket.ikigai-prod-logs.id
  target_bucket = aws_s3_bucket.bucket-logging-v1-prod.id
  target_prefix = ""
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-logs-versioning" {
  bucket = aws_s3_bucket.ikigai-prod-logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-logs-encryption" {
  bucket = aws_s3_bucket.ikigai-prod-logs.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}