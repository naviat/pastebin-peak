
# AWS User Policy

## Introduction

Use this module to create an IAM User policy in AWS. 

## Resources Created

* IAM User policy

## How to reference

In your terraform script:

```tf

module "aws_iam_user_policy" {
  source = "./modules/aws_iam_user_policy.git"

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
| [aws_iam_user_policy.aws_core_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_policy_file"></a> [aws\_iam\_policy\_file](#input\_aws\_iam\_policy\_file) | Path of Json file containing IAM User policy. | `string` | n/a | yes |
| <a name="input_aws_iam_policy_name"></a> [aws\_iam\_policy\_name](#input\_aws\_iam\_policy\_name) | Name of IAM policy. | `string` | n/a | yes |
| <a name="input_aws_iam_user_name"></a> [aws\_iam\_user\_name](#input\_aws\_iam\_user\_name) | Name of IAM user policy will be attached to. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->