
locals {
  aws_subnets = flatten([for net in var.networks : [
    for subnet in net.subnets : {
      key               = "${subnet.cidr}"
      network           = net.network
      cidr              = subnet.cidr
      availability_zone = subnet.az
      type              = subnet.type
    }
    ]
  ])
  aws_subnet_vpc_mapping = { for cidr in local.aws_subnets : cidr.key => cidr }
}

resource "aws_vpc" "vpc" {
  for_each   = { for net in var.networks : net.network => net }
  cidr_block = each.value.network
}


resource "aws_subnet" "subnet" {
  for_each                = { for cidr in local.aws_subnets : cidr.key => cidr }
  vpc_id                  = aws_vpc.vpc[each.value.network].id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.type == "public" ? true : false
}


resource "aws_internet_gateway" "gw" {
  for_each = { for net in var.networks : net.network => net if net.internet }
  vpc_id   = aws_vpc.vpc[each.value.network].id

  tags = {
    Name = "IGW-${each.value.network}"
  }
}

resource "aws_route_table" "rt" {
  for_each = { for net in var.networks : net.network => net if net.internet }
  vpc_id   = aws_vpc.vpc[each.value.network].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw[each.value.network].id
  }

  tags = {
    Name = "TF-RT-${each.value.network}"
  }
}

resource "aws_main_route_table_association" "rt_to_vpc" {
  for_each       = { for net in var.networks : net.network => net if net.internet }
  vpc_id         = aws_vpc.vpc[each.value.network].id
  route_table_id = aws_route_table.rt[each.value.network].id
}