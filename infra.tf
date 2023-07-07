module "vpc" {
    source = "./vpc"

}

module "elasticache_cluster" {
    source = "./elasticache"
    subnet_group_name    = output.public_subnets

}

