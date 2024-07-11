output "cold-storage-bucket-name" {
  value = aws_s3_bucket.ikigai-cold-storage.id
}

output "connector-bucket-name" {
  value = aws_s3_bucket.ikigai-connectors.id
}

output "dataset-bucket-name" {
  value = aws_s3_bucket.ikigai-datasets.id
}

output "model-bucket-name" {
  value = aws_s3_bucket.ikigai-models.id
}

output "sample-dataset-bucket-name" {
  value = aws_s3_bucket.ikigai-sample-datasets.id
}

output "temp-bucket-name" {
  value = aws_s3_bucket.ikigai-temp.id
}

output "search-bucket-name" {
  value = aws_s3_bucket.pypr-test.id
}