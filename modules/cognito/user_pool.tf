resource "aws_ses_email_identity" "email-sender" {
  email = var.welcome_email_address
}

resource "aws_cognito_user_pool" "user-pool" {
  name                     = var.user_pool_name
  auto_verified_attributes = ["email"]
  deletion_protection      = "INACTIVE"
  mfa_configuration        = "OFF"
  username_attributes      = []

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
    recovery_mechanism {
      name     = "verified_phone_number"
      priority = 2
    }  
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
    invite_message_template {
      email_subject = "Your temporary password"
      email_message = "Your username is {username} and temporary password is {####}."
      sms_message   = "Your username is {username} and temporary password is {####}." 
    }
  }

  email_configuration {
    email_sending_account  = "DEVELOPER"
    reply_to_email_address = var.welcome_email_address
    source_arn             = aws_ses_email_identity.email-sender.arn
  }

  password_policy {
    minimum_length    = var.password_minimum_length
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
    temporary_password_validity_days = var.temporary_password_validity_days
  }

  schema {
    name = "email"
    attribute_data_type = "String"
    developer_only_attribute = false
    mutable = true
    required = true
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }

  username_configuration {
    case_sensitive = true
  }

  verification_message_template {
    default_email_option  = "CONFIRM_WITH_LINK"
    email_subject_by_link = "Welcome to Ikigai Labs"
    email_message_by_link = file("${path.module}/email_message.html")
  }
}

resource "aws_cognito_user_pool_domain" "user-pool-domain" {
  domain       = "ikigailabs"
  user_pool_id = aws_cognito_user_pool.user-pool.id
}

resource "aws_cognito_user_pool_client" "user-pool-client" {
  name                                          = "ikigailabs"
  user_pool_id                                  = aws_cognito_user_pool.user-pool.id

  access_token_validity                         = var.access_token_validity
  id_token_validity                             = var.id_token_validity
  refresh_token_validity                        = var.refresh_token_validity
  token_validity_units {
    access_token  = var.access_token_validity_units
    id_token      = var.id_token_validity_units
    refresh_token = var.refresh_token_validity_units
  }

  allowed_oauth_flows                           = ["code"]
  allowed_oauth_flows_user_pool_client          = true
  allowed_oauth_scopes                          = ["email", "openid", "profile"]

  callback_urls                                 = ["https://${var.base_hostname}/user-verified"]
  logout_urls                                   = ["https://${var.base_hostname}"]
  default_redirect_uri                          = null

  enable_propagate_additional_user_context_data = false
  enable_token_revocation                       = false
  explicit_auth_flows                           = ["ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
  generate_secret                               = null
  prevent_user_existence_errors                 = "LEGACY"
  supported_identity_providers                  = ["Google"]

  read_attributes                               = ["address", "birthdate", "email", "email_verified", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "phone_number_verified", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"]
  write_attributes                              = ["address", "birthdate", "email", "family_name", "gender", "given_name", "locale", "middle_name", "name", "nickname", "phone_number", "picture", "preferred_username", "profile", "updated_at", "website", "zoneinfo"]
}