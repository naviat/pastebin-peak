# AWS Basic Network

## Introduction

Use this module to create a basic VPC and necessary dependencies so that you can quickly get your EC2 instances created.

## Resources Created

* VPC
* 1 x Subnet
* Internet Gateway
* Default Route Table
* Default Security Group

## How to reference

In your terraform script:

```

module "aws_basic_network" {
  source = "./modules/aws_basic_network"

# VARIABLE DEFINITION

}
```

## Notes

Security group will create ingress rules that are open to the private network and *your* ip address.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.aws_core_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_default_security_group.aws_core_dsg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_internet_gateway.aws_core_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_subnet.aws_core_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.aws_core_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [http_http.my_ip_address](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_public_cidrs"></a> [additional\_public\_cidrs](#input\_additional\_public\_cidrs) | List of additional cidrs that need to be added to ingress rules. In format 1.2.3.4/32 | `list` | n/a | yes |
| <a name="input_aws_core_az_1"></a> [aws\_core\_az\_1](#input\_aws\_core\_az\_1) | Availability zone for first subnet of AWS core network | `string` | n/a | yes |
| <a name="input_aws_core_subnet_cidr1"></a> [aws\_core\_subnet\_cidr1](#input\_aws\_core\_subnet\_cidr1) | CIDR block for first subnet of AWS Core network | `string` | n/a | yes |
| <a name="input_aws_core_vpc_cidr"></a> [aws\_core\_vpc\_cidr](#input\_aws\_core\_vpc\_cidr) | VPC CIDR block for the AWS Core VPC | `string` | n/a | yes |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Value that will be tagged as ENVIRONMENT, on all AWS resources | `string` | n/a | yes |
| <a name="input_owner_tag"></a> [owner\_tag](#input\_owner\_tag) | Value that will be tagged as OWNER, on all AWS resources | `string` | n/a | yes |
| <a name="input_prefix_tag"></a> [prefix\_tag](#input\_prefix\_tag) | Prefix string added to Name tag | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_default_sg_id"></a> [aws\_default\_sg\_id](#output\_aws\_default\_sg\_id) | AWS Default Security Group ID |
| <a name="output_aws_subnet_id"></a> [aws\_subnet\_id](#output\_aws\_subnet\_id) | AWS Subnet ID |
| <a name="output_aws_vpc_id"></a> [aws\_vpc\_id](#output\_aws\_vpc\_id) | AWS VPC ID |
<!-- END_TF_DOCS -->