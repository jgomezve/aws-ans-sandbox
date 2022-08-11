region = "us-east-2"
networks = [
  {
    network  = "172.16.0.0/16"
    internet = true
    subnets = [
      {
        cidr = "172.16.0.0/24"
        az   = "us-east-2a"
        type = "public"
      },
      {
        cidr = "172.16.1.0/24"
        az   = "us-east-2a"
        type = "private"
      },
      {
        cidr = "172.16.2.0/24"
        az   = "us-east-2b"
        type = "private"
      }
    ]
  },
  {
    network  = "172.17.0.0/16"
    internet = false
    subnets = [
      {
        cidr = "172.17.1.0/24"
        az   = "us-east-2a"
        type = "private"
      },
      {
        cidr = "172.17.2.0/24"
        az   = "us-east-2a"
        type = "private"
      },
      {
        cidr = "172.17.3.0/24"
        az   = "us-east-2b"
        type = "private"
      }
    ]
  },
  # {
  #   network = "172.18.0.0/16"
  #   internet = false
  #   subnets = [
  #     {
  #       cidr = "172.18.0.0/24"
  #       az   = "us-east-2a"
  #       type = "private"
  #     }
  #   ]
  # }
]
instances = [
  {
    name   = "VM1"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "172.16.0.0/24"
  },
  {
    name   = "VM2"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "172.16.1.0/24"
  },
  {
    name   = "VM3"
    ami    = "0b2aa2d51e8c10b4a"
    type   = "t2.micro"
    subnet = "172.17.2.0/24"
  },
  {
    name   = "VM4"
    ami    = "0b2aa2d51e8c10b4a"
    type   = "t2.micro"
    subnet = "172.17.2.0/24"
  }
]