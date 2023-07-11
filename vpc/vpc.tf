# resource "aws_default_vpc" "vpc-main" {
#     cidr_block = "10.0.0.0/16"
#     instance_tenancy = "default"
#     enable_dns_support = false
#     enable_dns_hostnames = false
#     assign_generated_ipv6_cidr_block = false
#     availability_zone= "ap-south-1"
    
# }

# resource "aws_subnet" "private-sub" {
#     vpc_id     = aws_default_vpc.vpc-main.id
#     cidr_block = "10.0.1.0/24"

# }

# resource "aws_subnet" "public-sub" {
#     vpc_id     = aws_default_vpc.vpc-main.id
#     cidr_block = "10.0.2.0/24"

# }


resource "aws_default_vpc" "default" {
    
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_default_subnet" "private-sub" {
    availability_zone= "ap-south-1a"

}

resource "aws_default_subnet" "public-sub" {
    availability_zone= "ap-south-1a"

}

resource "aws_security_group" "sg-vpc" {
  vpc_id = aws_default_vpc.default.id
 
  ingress {
   protocol         = "tcp"
   from_port        = 80
   to_port          = 80
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
  ingress {
   protocol         = "tcp"
   from_port        = 443
   to_port          = 443
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
  egress {
   protocol         = "-1"
   from_port        = 0
   to_port          = 0
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
}

