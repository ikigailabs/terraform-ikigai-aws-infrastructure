variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "welcome_email_address" {
  type        = string
  description = "Email address which will send verification email"
}

variable "user_pool_name" {
  type        = string
  description = "Ikigai Cognito user pool name"
  default     = "ikigai-user-pool"
}

variable "password_minimum_length" {
  type        = number
  description = "Minimum password length for users"
  default     = 10
}

variable "temporary_password_validity_days" {
  type        = number
  description = "Number of days that a temporary password will be valid"
  default     = 7
}

variable "user_pool_domain_name" {
  type        = string
  description = "Domain name of the Ikigai Cognito user pool"
}

variable "user_pool_client_name" {
  type        = string
  description = "Name of Ikigai Cognito user pool client"
}

variable "access_token_validity" {
  type        = number
  description = "Number of time units (set by access_token_validity_units) that the access token is valid"
  default     = 60
}

variable "access_token_validity_units" {
  type        = string
  description = "Time unit in for the value in access_token_validity, value must either be one of 'seconds', 'minutes', 'hours', or 'days'"
  default     = "minutes"
}

variable "id_token_validity" {
  type        = number
  description = "Number of time units (set by id_token_validity_units) that the id token is valid"
  default     = 30
}

variable "id_token_validity_units" {
  type        = string
  description = "Time unit in for the value in id_token_validity, value must either be one of 'seconds', 'minutes', 'hours', or 'days'"
  default     = "minutes"
}

variable "refresh_token_validity" {
  type        = number
  description = "Number of time units (set by refresh_token_validity_units) that the refresh token is valid"
  default     = 30
}

variable "refresh_token_validity_units" {
  type        = string
  description = "Time unit in for the value in refresh_token_validity, value must either be one of 'seconds', 'minutes', 'hours', or 'days'"
  default     = "days"
}

variable "base_hostname" {
  type        = string
  description = "Base hostname for the ikigai frontend (ex. app.ikigailabs.io)"
}

variable "google_client_id" {
  type        = string
  description = "Client id for Google identity provider"
}

variable "google_client_secret" {
  type        = string
  description = "Client secret for Google identity provider"
}