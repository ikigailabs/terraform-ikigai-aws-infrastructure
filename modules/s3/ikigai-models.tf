resource "aws_s3_bucket" "ikigai-models-prod" {
  bucket    = var.ikigai_models_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-models-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-models-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-models-acl" {
  bucket = aws_s3_bucket.ikigai-models-prod.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-models-ownership-controls]
}

# Send bucket logs to the ikigai-prod-logs bucket
resource "aws_s3_bucket_logging" "ikigai-models-logging" {
  bucket        = aws_s3_bucket.ikigai-models-prod.id
  target_bucket = aws_s3_bucket.ikigai-prod-logs.id
  target_prefix = "log/"
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-models-versioning" {
  bucket = aws_s3_bucket.ikigai-models-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-models-encryption" {
  bucket = aws_s3_bucket.ikigai-models-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}