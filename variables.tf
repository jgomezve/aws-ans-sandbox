variable "region" {
  type = string
}
variable "networks" {
  type = list(object({
    network  = string
    internet = bool
    subnets = list(object({
      cidr = string
      az   = string
      type = string
    }))
  }))
}

variable "instances" {
  type = list(object({
    name   = string
    ami    = string
    type   = string
    subnet = string
  }))
}