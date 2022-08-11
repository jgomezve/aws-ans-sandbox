output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "subnet_info" {
  description = "Subnet Information (Subnet ID, Range, Security Group)"
  value = [for subnet in aws_subnet.subnet : {
    vpc_id            = aws_vpc.vpc.id
    subnet_id         = subnet.id
    subnet_range      = subnet.cidr_block
    security_group_id = aws_security_group.allow_ssh_icmp.id
    public            = subnet.map_public_ip_on_launch
  }]
}