output "subnets_info" {
  description = "Information about configured subnets"
  value       = local.subnet_info_list
}

output "vms_info" {
  description = "Information about configured VMs"
  value       = local.ec2_info_list
}

