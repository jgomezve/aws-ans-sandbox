variable "name" {
  description = "VPC Name"
  type        = string
  default     = ""
}

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
    name              = optional(string)
  }))
}

variable "internet_access" {
  description = "Flag to enable VPC Internet access"
  type        = bool
  default     = false
}

variable "enable_dns" {
  description = "Flag to enable VPC DNS Support"
  type        = bool
  default     = true
}

variable "enable_hostname" {
  description = "Flag to enable VPC hostname resolution"
  type        = bool
  default     = true
}