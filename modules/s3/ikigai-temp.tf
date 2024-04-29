resource "aws_s3_bucket" "ikigai-temp-prod" {
  bucket    = var.ikigai_temp_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-temp-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-temp-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-temp-acl" {
  bucket = aws_s3_bucket.ikigai-temp-prod.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-temp-ownership-controls]
}

# Send bucket logs to the ikigai-prod-logs bucket
resource "aws_s3_bucket_logging" "ikigai-temp-logging" {
  bucket        = aws_s3_bucket.ikigai-temp-prod.id
  target_bucket = aws_s3_bucket.ikigai-prod-logs.id
  target_prefix = "log/"
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-temp-versioning" {
  bucket = aws_s3_bucket.ikigai-temp-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Create a lifecycle rule for the bucket
resource "aws_s3_bucket_lifecycle_configuration" "ikigai-temp-lifecycle" {
  bucket = aws_s3_bucket.ikigai-temp-prod.id

  rule {
    id     = "default_cleanup"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 1
    }

    expiration {
      days = 1
      expired_object_delete_marker = false
    }
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-temp-encryption" {
  bucket = aws_s3_bucket.ikigai-temp-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}