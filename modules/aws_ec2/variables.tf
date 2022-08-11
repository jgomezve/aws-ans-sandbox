variable "name" {
  description = "EC2 Instance Name"
  type        = string
}

variable "ami" {
  description = "EC2 Instance AMI"
  type        = string
}

variable "type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS Public key name on the EC2 instance"
  type        = string
}

variable "ssh_key_filename" {
  description = "Private key to push to the EC2 instance"
  type        = string
  default     = ""
}

variable "internet_access" {
  description = "Internet Access for EC2"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "Subnet ID of the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID of the EC2 isntance"
  type        = string
}