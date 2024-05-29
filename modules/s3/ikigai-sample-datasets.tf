resource "aws_s3_bucket" "ikigai-sample-datasets-prod" {
  bucket = "ikigai-sample-datasets-prod"
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "ikigai-sample-datasets-ownership-controls" {
  bucket = aws_s3_bucket.ikigai-sample-datasets-prod.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Set the access control level for the bucket
resource "aws_s3_bucket_acl" "ikigai-sample-datasets-acl" {
  bucket = aws_s3_bucket.ikigai-sample-datasets-prod.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.ikigai-sample-datasets-ownership-controls]
}

# Send bucket logs to the ikigai-prod-logs bucket
resource "aws_s3_bucket_logging" "ikigai-sample-datasets-logging" {
  bucket        = aws_s3_bucket.ikigai-sample-datasets-prod.id
  target_bucket = aws_s3_bucket.ikigai-prod-logs.id
  target_prefix = "log/"
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "ikigai-sample-datasets-versioning" {
  bucket = aws_s3_bucket.ikigai-sample-datasets-prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable CORS for the bucket
resource "aws_s3_bucket_cors_configuration" "ikigai-sample-datasets-cors" {
  bucket = aws_s3_bucket.ikigai-sample-datasets-prod.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = [ "PUT", "GET" ]
    allowed_origins = [ "*" ]
    max_age_seconds = 3000
  }
}

# Enable server-side encryption for the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "ikigai-sample-datasets-encryption" {
  bucket = aws_s3_bucket.ikigai-sample-datasets-prod.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}