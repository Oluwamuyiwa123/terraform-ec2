terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">=1.2.0"
}

# Provider configuration
provider "aws" {
  region = "us-west-2"  
}

# # VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   tags = {
#     Name = "muyiwa-vpc"
#   }
# }

# # Subnet
# resource "aws_subnet" "public" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-west-2b" 
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "muyiwa-subnet"
#   }
# }

# # Internet Gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "muyiwa-igw-public"
#   }
# }

# # Route Table
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "muyi-rtw-public"
#   }
# }

# # Route Table Association
# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }

# # Security Group
# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description = "SSH from anywhere"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_ssh"
#   }
# }

# # EC2 Instance
# resource "aws_instance" "web" {
#   ami           = "ami-00bd8b606829fb560" 
#   instance_type = "t3.medium"
#   subnet_id     = aws_subnet.public.id
#   security_groups = [aws_security_group.allow_ssh.id]
  
#   # Key pair name (create this in AWS Console first)
#   key_name = "tos"

#   tags = {
#     Name = "web-server"
#   }
# }

# # Output the public IP
# output "instance_public_ip" {
#   description = "Public IP of the EC2 instance"
#   value       = aws_instance.web.public_ip
# }