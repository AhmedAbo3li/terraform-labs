resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.subnets["private-subnet-1"].id, 
    aws_subnet.subnets["private-subnet-2"].id  
  ]

  tags = {
    Name = "RDS Subnet Group"
  }
}


resource "aws_db_instance" "my_rds" {
  identifier            = "my-mysql-db"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username            = "admin"
  password            = "SuperSecret123!"
  publicly_accessible  = false
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}
