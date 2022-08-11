<!-- BEGIN_TF_DOCS -->
# Sandbox for the AWS Advanced Networking Specialty Exam.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_networks"></a> [networks](#input\_networks) | n/a | <pre>list(object({<br>    network  = string<br>    internet = bool<br>    subnets = list(object({<br>      cidr = string<br>      az   = string<br>      type = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | n/a | <pre>list(object({<br>    name   = string<br>    ami    = string<br>    type   = string<br>    subnet = string<br>  }))</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_info"></a> [subnets\_info](#output\_subnets\_info) | n/a |
| <a name="output_vms_info"></a> [vms\_info](#output\_vms\_info) | n/a |
<!-- END_TF_DOCS -->