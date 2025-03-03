# resource "aws_elasticache_subnet_group" "redis-subnet-group-v2" {
#   name       = "redis-subnet-group-v2"
#   subnet_ids = [module.network.subnets["private-subnet-1"].id, module.network.subnets["private-subnet-2"].id]
# }

# resource "aws_elasticache_cluster" "redis_cluste-2" {
#   cluster_id         = "my-redis-cluster-2"
#   engine             = "redis"
#   node_type          = "cache.t3.micro"
#   num_cache_nodes    = 1
#   subnet_group_name  = aws_elasticache_subnet_group.redis-subnet-group-v2.name
#   security_group_ids = [module.network.security_groups["redis_sg"]]
# }