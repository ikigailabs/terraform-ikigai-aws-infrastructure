# Ikigai Cognito Terraform Module

This module allows you to create the AWS Cognito infrastructure for an Ikigai application setup.
Cognito is not a necessary resource, as you can enable passthrough authentication at a later stage of the Ikigai setup.

## Usage

A simple usage example of the Ikigai Cognito module, only setting the required inputs, would be:

```hcl
module "aws-infrastructure_cognito" {
  source  = "ikigailabs/aws-infrastructure/ikigai//modules/cognito"
  version = "~> 1.0"
  
  aws_region = module.aws-infrastructure_vpc.vpc_region
  base_hostname = "domain.com"
  google_client_id = "example-google-client-id"
  google_client_secret = "example-google-client-secret"
  user_pool_client_name = "user-pool-client"
  user_pool_domain_name = "user-pool-domain"
  welcome_email_address = "welcome@domain.com"
}
```

It is possible to further customize the deployment using the inputs listed below. To do so, add `[input name] = target_value` within the module braces.
For example, to set the `password_minimum_length` input to `2`, add `password_minimum_length = 2` to the module block. Remember to add double quotes for string inputs! 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region that the cognito infrastructure will be deployed in | `string` | n/a | yes |
| base\_hostname | The hostname of the ikigai deployment - this value will be used to construct the callback and logout urls | `string` | n/a | yes |
| google\_client\_id | The Google OAuth client id that will allow sign-in through Google | `string` | n/a | yes |
| google\_client\_secret | The Google OAuth client secret that will allow sign-in through Google | `string` | n/a | yes |
| user\_pool\_client\_name | Name of the Cognito app client | `string` | n/a | yes |
| user\_pool\_domain | Domain name of the Cognito app client. The value will be used to construct a Cognito domain of the form `https://[var.user_pool_domain].auth.[var.aws_region].amazoncognito.com` | `string` | n/a | yes |
| welcome\_email\_address | The email address that will send verification as well and change password emails to users using the Simple Email Service | `string` | n/a | yes |
| access\_token\_validity | Time limit after which the access token is no longer valid and cannot be used. The unit of time is controlled by the `access_token_validity_units` variable | `number` | `60` | no |
| access\_token\_validity\_units | Time unit in for the value in `access_token_validity` | `string` | `"minutes"` | no |
| id\_token\_validity | Time limit after which the id token is no longer valid and cannot be used. The unit of time is controlled by the `id_token_validity_units` variable | `number` | `30` | no |
| id\_token\_validity\_units | Time unit in for the value in `id_token_validity` | `string` | `"minutes"` | no |
| password\_minimum\_length | Minimum length of the password that new users have to set. | `number` | `10` | no |
| refresh\_token\_validity | Time limit after which the refresh token is no longer valid and cannot be used. The unit of time is controlled by the `refresh_token_validity_units` variable | `number` | `30` | no |
| refresh\_token\_validity\_units | Time unit in for the value in `refresh_token_validity` | `string` | `"days"` | no |
| temporary\_password\_validity\_days | The number of days a temporary password is valid | `number` | `7` | no |
| user\_pool\_name | Name of the Ikigai Cognito user pool | `string` | `"ikigai-user-pool"` | no |

## Outputs

These values will be placed into the environment files in the Ikigai Helm chart during the microservices setup.

| Name | Description |
|------|-------------|
| external\_auth\_domain_name | Cognito domain of the form `https://[var.user_pool_domain].auth.[var.aws_region].amazoncognito.com` |
| base\_url | The hostname of the ikigai deployment - same as `var.base_hostname` |
| cognito\_user\_pool\_id | Id of the Ikigai user pool that is created |
| cognito\_client\_id | Id of the Ikigai app client that is created |
| region | AWS region where the Cognito infrastructure is created |