# AWS IAM Access Key

## Introduction

Use this module to create an access key and secret key for a given user. 

## Resources Created

* Access key ID
* Secret Access key

## How to reference

In your terraform script:

```tf

module "aws_iam_access_key" {
  source = "./modules/aws_iam_access_key.git"

# VARIABLE DEFINITION

}
```

## Notes

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.aws_user_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_user_name"></a> [aws\_iam\_user\_name](#input\_aws\_iam\_user\_name) | Name of IAM user. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_user_key_id"></a> [aws\_user\_key\_id](#output\_aws\_user\_key\_id) | Access key ID for aws\_core\_user |
| <a name="output_aws_user_key_secret"></a> [aws\_user\_key\_secret](#output\_aws\_user\_key\_secret) | Secret Access key for aws\_core\_user |
<!-- END_TF_DOCS -->