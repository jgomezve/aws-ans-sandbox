variable "cidr" {
  description = "AWS VPC CIDR"
  type        = string
}

variable "subnets" {
  description = "AWS VPC's subnets"
  type = list(object({
    range             = string
    availability_zone = string
    type              = string
  }))
}

variable "internet_access" {
  description = "Flag to enable VPC Internet access"
  type        = bool
  default     = false
}