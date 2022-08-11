
resource "aws_instance" "ec2" {
  for_each      = { for vm in var.instances : vm.name => vm }
  ami           = "ami-${each.value.ami}"
  instance_type = each.value.type
  key_name      = "mysshkey"

  vpc_security_group_ids = [aws_security_group.allow_ssh_icmp[local.aws_subnet_vpc_mapping[each.value.subnet].network].id]

  subnet_id = aws_subnet.subnet[each.value.subnet].id
  tags = {
    Name = each.value.name
  }

}

resource "null_resource" "null" {
  for_each      = { for vm in var.instances : vm.name => vm if local.aws_subnet_vpc_mapping[vm.subnet].type == "public"}
  provisioner "file" {
    source      = "mysshkey.pem"
    destination = "/home/ec2-user/mysshkey.pem"
  }
  connection {
    host     = aws_instance.ec2[each.value.name].public_ip
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file("mysshkey.pem")}"
  }
}