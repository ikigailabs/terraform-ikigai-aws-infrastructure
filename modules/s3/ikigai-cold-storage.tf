resource "aws_s3_bucket" "ikigai-cold-storage-prod" {
  bucket = var.ikigai_cold_storage_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-cold-storage-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-cold-storage-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-cold-storage-acl" {
  bucket = aws_s3_bucket.ikigai-cold-storage-prod.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-cold-storage-ownership-controls]
}

# Send bucket logs to the ikigai-prod-logs bucket
resource "aws_s3_bucket_logging" "ikigai-cold-storage-logging" {
  bucket        = aws_s3_bucket.ikigai-cold-storage-prod.id
  target_bucket = aws_s3_bucket.ikigai-prod-logs.id
  target_prefix = "log/"
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-cold-storage-versioning" {
  bucket = aws_s3_bucket.ikigai-cold-storage-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-cold-storage-encryption" {
  bucket = aws_s3_bucket.ikigai-cold-storage-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}