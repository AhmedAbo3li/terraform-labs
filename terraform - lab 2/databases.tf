# resource "aws_security_group" "db_sg" {
#   name        = "db-security-group"
#   description = "Allow MySQL and Redis traffic"
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/16"]  # Adjust as needed
#   }

#   ingress {
#     from_port   = 6379
#     to_port     = 6379
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/16"]  # Adjust as needed
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_db_subnet_group" "private_db_subnet_group" {
#   name       = "private-db-subnet-group"
#   subnet_ids = [aws_subnet.subnets["private-subnet-1"].id, aws_subnet.subnets["private-subnet-2"].id]
# }

# resource "aws_db_instance" "my_rds" {
#   identifier            = "my-mysql-db"
#   engine               = "mysql"
#   instance_class       = "db.t3.micro"
#   allocated_storage    = 20
#   username            = "admin"
#   password            = "supersecurepassword"
#   db_subnet_group_name = aws_db_subnet_group.private_db_subnet_group.name
#   vpc_security_group_ids = [aws_security_group.db_sg.id]
#   skip_final_snapshot  = true
# }

# resource "aws_elasticache_subnet_group" "private_redis_subnet_group" {
#   name       = "private-redis-subnet-group"
#   subnet_ids = [aws_subnet.subnets["private-subnet-1"].id, aws_subnet.subnets["private-subnet-2"].id]
# }

# resource "aws_elasticache_cluster" "my_redis" {
#   cluster_id           = "my-redis-cluster-v2"
#   engine              = "redis"
#   node_type           = "cache.t3.micro"
#   num_cache_nodes     = 1
#   subnet_group_name   = aws_elasticache_subnet_group.private_redis_subnet_group.name
#   security_group_ids  = [aws_security_group.db_sg.id]
# }
