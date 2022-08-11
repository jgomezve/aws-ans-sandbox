<!-- BEGIN_TF_DOCS -->
# AWS VPC Module
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | AWS VPC CIDR | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | AWS VPC's subnets | <pre>list(object({<br>    range             = string<br>    availability_zone = string<br>    type              = string<br>  }))</pre> | n/a | yes |
| <a name="input_internet_access"></a> [internet\_access](#input\_internet\_access) | Flag to enable VPC Internet access | `bool` | `false` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
| <a name="output_subnet_info"></a> [subnet\_info](#output\_subnet\_info) | VPC ID |
<!-- END_TF_DOCS -->