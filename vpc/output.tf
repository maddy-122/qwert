output "public_subnets" {
    value = aws_default_subnet.public-sub.id
  
}

output "security_group_ecs" {
    value = aws_security_group.sg-vpc.id
  
}