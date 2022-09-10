
locals {
  subnet_info_list = flatten([for vpc in module.my_vpc : [
    for subnet in vpc.subnet_info : {
      subnet_id         = subnet.subnet_id
      subnet_range      = subnet.subnet_range
      vpc_id            = subnet.vpc_id
      security_group_id = subnet.security_group_id
      public            = subnet.public
    }]
  ])
  subnet_info_dict = { for subnet in local.subnet_info_list : subnet.subnet_range => subnet }

  ec2_info_list = [for ec2 in module.my_ec2 : {
    ec2_id     = ec2.ec2_id
    private_ip = ec2.ec2_private_ip
    public_ip  = ec2.ec2_public_ip
    }
  ]
}

module "my_vpc" {
  source   = "./modules/aws_vpc"
  for_each = { for net in var.networks : net.network => net }
  cidr     = each.value.network
  name     = lookup(each.value, "name", "")
  subnets = [for subnet in lookup(each.value, "subnets", []) : {
    range             = subnet.cidr
    availability_zone = subnet.az
    type              = lookup(subnet, "type", "private")
    name              = lookup(subnet, "name", subnet.cidr)
  }]
  # TODO: If one subnet is public then true
  internet_access = true
}

module "my_ec2" {
  source            = "./modules/aws_ec2"
  for_each          = { for inst in var.instances : inst.name => inst }
  name              = each.value.name
  ami               = each.value.ami
  type              = lookup(each.value, "type", "t2.micro")
  key_name          = "mysshkey"
  ssh_key_filename  = "mysshkey.pem"
  subnet_id         = local.subnet_info_dict[each.value.subnet].subnet_id
  security_group_id = local.subnet_info_dict[each.value.subnet].security_group_id
  internet_access   = local.subnet_info_dict[each.value.subnet].public
}

