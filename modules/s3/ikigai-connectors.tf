resource "aws_s3_bucket" "ikigai-connectors-prod" {
  bucket = var.ikigai_connectors_bucket_name
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-connectors-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-connectors-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}
 
# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-connectors-acl" {
  bucket = aws_s3_bucket.ikigai-connectors-prod.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-connectors-ownership-controls]
}

# Send bucket logs to the ikigai-prod-logs bucket
resource "aws_s3_bucket_logging" "ikigai-connectors-logging" {
  bucket        = aws_s3_bucket.ikigai-connectors-prod.id
  target_bucket = aws_s3_bucket.ikigai-prod-logs.id
  target_prefix = "log/"
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-connectors-versioning" {
  bucket = aws_s3_bucket.ikigai-connectors-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-connectors-encryption" {
  bucket = aws_s3_bucket.ikigai-connectors-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}