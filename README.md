[![Release][release-image]][release] [![CI][ci-image]][ci] [![License][license-image]][license] [![Registry][registry-image]][registry]

# terraform-aws-ec2-instance-type-metrics

A Terraform module which takes an EC2 instance type and returns the recommended memory allocation to assign to a process.

## Usage

You can use this module to find a safe amount of memory to assign to an application running on an instance.  Depending on what other processes you are running on your server you should tweak the percentages and parameters accordingly but the defaults should work for systems where you are only running a single application.

```hcl
module "instance_type_metrics" {
  source  = "snowplow-devops/ec2-instance-type-metrics/aws"

  instance_type = "t3.small"
}

locals {
  app_memory = "${module.instance_type_metrics.memory_application_mb}m"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_instance_type.type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use | `string` | n/a | yes |
| <a name="input_memory_for_app_pct"></a> [memory\_for\_app\_pct](#input\_memory\_for\_app\_pct) | The percent of the instance memory to allocate to the application | `number` | `80` | no |
| <a name="input_memory_for_os_mb"></a> [memory\_for\_os\_mb](#input\_memory\_for\_os\_mb) | The minimum amount of memory that must be available for the base Operating System | `number` | `384` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_memory_application_mb"></a> [memory\_application\_mb](#output\_memory\_application\_mb) | The recommended memory to allocate to an application running on this instance |
| <a name="output_memory_application_mb_max"></a> [memory\_application\_mb\_max](#output\_memory\_application\_mb\_max) | The maximum memory to allocate to an application running on this instance |
| <a name="output_memory_mb"></a> [memory\_mb](#output\_memory\_mb) | The amount of memory in mb allocated to this instance |
| <a name="output_v_cpu_count"></a> [v\_cpu\_count](#output\_v\_cpu\_count) | The number of vCPUs allocated to this instance |

# Copyright and license

The Terraform AWS EC2 Instance Type Metrics project is Copyright 2022-2022 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[release]: https://github.com/snowplow-devops/terraform-aws-ec2-instance-type-metrics/releases/latest
[release-image]: https://img.shields.io/github/v/release/snowplow-devops/terraform-aws-ec2-instance-type-metrics

[ci]: https://github.com/snowplow-devops/terraform-aws-ec2-instance-type-metrics/actions?query=workflow%3Aci
[ci-image]: https://github.com/snowplow-devops/terraform-aws-ec2-instance-type-metrics/workflows/ci/badge.svg

[license]: https://www.apache.org/licenses/LICENSE-2.0
[license-image]: https://img.shields.io/badge/license-Apache--2-blue.svg?style=flat

[registry]: https://registry.terraform.io/modules/snowplow-devops/ec2-instance-type-metrics/aws/latest
[registry-image]: https://img.shields.io/static/v1?label=Terraform&message=Registry&color=7B42BC&logo=terraform
