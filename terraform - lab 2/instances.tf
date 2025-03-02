resource "aws_instance" "instances" {
  count = length(var.instance_configs)  

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id     = aws_subnet.subnets[var.instance_configs[count.index].subnet_name].id  # Use subnet_name

  tags = {
    Name = var.instance_configs[count.index].name
  }
  provisioner "local-exec" {
    command = "echo Bastion Public IP: ${self.public_ip}"
  }
}


