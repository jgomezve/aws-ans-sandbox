<!-- BEGIN_TF_DOCS -->
# AWS EC2 Module
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | EC2 Instance Name | `string` | n/a | yes |
| <a name="input_ami"></a> [ami](#input\_ami) | EC2 Instance AMI | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | EC2 Instance type | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | AWS Public key name on the EC2 instance | `string` | n/a | yes |
| <a name="input_ssh_key_filename"></a> [ssh\_key\_filename](#input\_ssh\_key\_filename) | Private key to push to the EC2 instance | `string` | `""` | no |
| <a name="input_internet_access"></a> [internet\_access](#input\_internet\_access) | Internet Access for EC2 | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID of the EC2 instance | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security Group ID of the EC2 isntance | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | n/a |
| <a name="output_ec2_private_ip"></a> [ec2\_private\_ip](#output\_ec2\_private\_ip) | n/a |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | n/a |
<!-- END_TF_DOCS -->