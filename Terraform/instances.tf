resource "aws_instance" "bastion" {
  ami           = "ami-0e1bed4f06a3b463d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.bastion_sg.id]
  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-0e1bed4f06a3b463d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.app_sg.id]
  tags = {
    Name = "AppServer"
  }
}