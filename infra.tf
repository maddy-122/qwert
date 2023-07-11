module "vpc" {
  source = "./vpc"

}

module "elasticache_cluster" {
  source = "./elasticache"
  # subnet_group_name    = output.public_subnets

}

module "cloudwatch_elasticcache" {
  source                  = "./cloudwatch"
  member_clusters         = ["cluster-one"]
  monitor_cpu_utilization = true
}

module "ecs_cluster" {
    source = "./ecs"

    subnet-ecs = [module.vpc.public_subnets]
    sg-ecs = [module.vpc.security_group_ecs]
  
}


