output "external_auth_domain_name" {
  description = ""
  value       = "https://${aws_cognito_user_pool_domain.user-pool-domain.domain}.auth.${var.aws_region}.amazoncognito.com"
}

output "base_url" {
  value = element(tolist(aws_cognito_user_pool_client.user-pool-client.logout_urls), 0)
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.user-pool.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.user-pool-client.id
}

output "region" {
  value = var.aws_region
}