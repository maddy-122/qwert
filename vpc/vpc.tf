resource "aws_vpc" "vpc-main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = false
    enable_dns_hostnames = false
    assign_generated_ipv6_cidr_block = false
    
}

resource "aws_subnet" "private-sub" {
    vpc_id     = aws_vpc.vpc-main.id
    cidr_block = "10.0.1.0/24"

}

resource "aws_subnet" "public-sub" {
    vpc_id     = aws_vpc.vpc-main.id
    cidr_block = "10.0.2.0/24"

}