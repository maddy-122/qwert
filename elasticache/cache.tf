resource "aws_elasticache_cluster" "cluster-one" {
  cluster_id           = "cluster-one"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
#   subnet_group_name    = output.public_subnets
}
