# default bucket encryption key on 10 day rotation 
resource "aws_kms_key" "prod_elasticsearch_key" {
  description             = "This key is used to encrypt the elasticsearch domain"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}