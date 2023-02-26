# AWS IAM User

## Introduction

Use this module to create an IAM user in AWS 

## Resources Created

* IAM User

## How to reference

In your terraform script:

```tf

module "aws_iam_user" {
  source = "./modules/aws_iam_user.git"

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
| [aws_iam_user.iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_user_name"></a> [aws\_iam\_user\_name](#input\_aws\_iam\_user\_name) | Name of IAM user. | `string` | n/a | yes |
| <a name="input_aws_iam_user_path"></a> [aws\_iam\_user\_path](#input\_aws\_iam\_user\_path) | Path of IAM user. | `string` | n/a | yes |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Value that will be tagged as ENVIRONMENT, on all AWS resources | `string` | n/a | yes |
| <a name="input_owner_tag"></a> [owner\_tag](#input\_owner\_tag) | Value that will be tagged as OWNER, on all AWS resources | `string` | n/a | yes |
| <a name="input_prefix_tag"></a> [prefix\_tag](#input\_prefix\_tag) | Prefix string added to Name tag | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_user_name"></a> [aws\_user\_name](#output\_aws\_user\_name) | name of AWS IAM user |
<!-- END_TF_DOCS -->