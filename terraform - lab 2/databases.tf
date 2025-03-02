resource "aws_db_instance" "my_rds" {
  identifier            = "my-mysql-db"
  engine               = "mysql"
  instance_class       = var.db_instance_class
  allocated_storage    = 20
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.subnets["private-subnet-1"].id]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  tags = {
    Name = "DBSecurityGroup"
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "redis-subnet-group"
  subnet_ids = [aws_subnet.subnets["private-subnet-1"].id]
}

resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "my-redis-cluster"
  engine              = "redis"
  node_type           = var.redis_node_type
  num_cache_nodes     = 1
  subnet_group_name   = aws_elasticache_subnet_group.redis_subnet.name
  security_group_ids  = [aws_security_group.redis_sg.id]
}

resource "aws_security_group" "redis_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  tags = {
    Name = "RedisSecurityGroup"
  }
}