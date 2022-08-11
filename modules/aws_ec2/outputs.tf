output "ec2_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.ec2.id
}

output "ec2_private_ip" {
  description = "EC2 Instance Private IP"
  value       = aws_instance.ec2.private_ip
}

output "ec2_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.ec2.public_ip
}