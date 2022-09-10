
locals {
  aws_subnets = [
    for subnet in var.subnets : {
      vpc_id    = aws_vpc.vpc
      subnet_id = aws_subnet.subnet[subnet.range].id
      network   = subnet.range
    }
  ]
  #aws_subnet_vpc_mapping = { for cidr in local.aws_subnets : cidr.key => cidr }
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = var.enable_dns
  enable_dns_hostnames = var.enable_hostname
  tags = {
    Name = var.name == "" ? var.cidr : var.name
  }
}

resource "aws_subnet" "subnet" {
  for_each                = { for subnet in var.subnets : subnet.range => subnet }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.range
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  tags = {
    Name = lookup(each.value, "name", each.value.range)
  }
}


resource "aws_internet_gateway" "gw" {
  count  = var.internet_access == true ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "IGW-${var.cidr}"
  }
}

resource "aws_route_table" "rt" {
  count  = var.internet_access == true ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw[0].id
  }
  tags = {
    Name = "TF-RT-${var.cidr}"
  }
}

resource "aws_main_route_table_association" "rt_to_vpc" {
  count          = var.internet_access == true ? 1 : 0
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.rt[0].id
}

resource "aws_security_group" "allow_ssh_icmp" {
  name        = "allow_ssh_web_and_icmp"
  description = "Allow SSH, Web and ICMP traffic from ALL"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_and_icmp"
  }
}