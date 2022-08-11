
resource "aws_instance" "ec2" {
  ami           = "ami-${var.ami}"
  instance_type = var.type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  subnet_id = var.subnet_id
  tags = {
    Name = var.name
  }

}

resource "null_resource" "private_key" {
  count = var.internet_access == true && var.ssh_key_filename != "" ? 1 : 0
  provisioner "file" {
    source      = var.ssh_key_filename
    destination = "/home/ec2-user/${var.ssh_key_filename}"
  }
  connection {
    host        = aws_instance.ec2.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${var.ssh_key_filename}")
  }
}

