region = "us-east-2"
networks = [
  {
    network  = "10.0.0.0/16"
    internet = false
    name     = "Application-VPC"
    subnets = [
      {
        cidr = "10.0.20.0/24"
        az   = "us-east-2a"
        type = "public"
        name = "Server-Subent"
      },
      {
        cidr = "10.0.10.0/24"
        az   = "us-east-2a"
        type = "public"
        name = "GWLBE-Subnet"
      },
      {
        cidr = "10.0.0.0/24"
        az   = "us-east-2b"
        type = "public"
        name = "Jump-Subnet"
      }
    ]
  },
  {
    network  = "192.168.0.0/16"
    internet = true
    name     = "Network-Appliance VPC"
    subnets = [
      {
        cidr = "192.168.10.0/24"
        az   = "us-east-2a"
        type = "private"
        name = "GWLB-Subnet"
      },
      {
        cidr = "192.168.20.0/24"
        az   = "us-east-2a"
        type = "private"
        name = "NVA-Subnet"
      },
      {
        cidr = "192.168.0.0/24"
        az   = "us-east-2c"
        type = "public"
        name = "Jump-Host-Subnet"
      }
    ]
  }
]
instances = [
  {
    name   = "App-Server"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "10.0.20.0/24"
  },
  {
    name   = "Jump-App"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "10.0.0.0/24"
  },
  {
    name   = "NVA"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "192.168.20.0/24"
  },
  {
    name   = "Jump-NVA"
    ami    = "089c6f2e3866f0f14"
    type   = "t2.micro"
    subnet = "192.168.0.0/24"
  }
]