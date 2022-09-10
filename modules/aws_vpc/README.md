<!-- BEGIN_TF_DOCS -->
# AWS VPC Module
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | VPC Name | `string` | `""` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | AWS VPC CIDR | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | AWS VPC's subnets | <pre>list(object({<br>    range             = string<br>    availability_zone = string<br>    type              = string<br>    name              = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_internet_access"></a> [internet\_access](#input\_internet\_access) | Flag to enable VPC Internet access | `bool` | `false` | no |
| <a name="input_enable_dns"></a> [enable\_dns](#input\_enable\_dns) | Flag to enable VPC DNS Support | `bool` | `true` | no |
| <a name="input_enable_hostname"></a> [enable\_hostname](#input\_enable\_hostname) | Flag to enable VPC hostname resolution | `bool` | `true` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
| <a name="output_subnet_info"></a> [subnet\_info](#output\_subnet\_info) | Subnet Information (Subnet ID, Range, Security Group) |
<!-- END_TF_DOCS -->