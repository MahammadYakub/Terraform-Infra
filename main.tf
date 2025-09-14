provider "aws" {
  region = var.aws_region
   
}

resource "aws_vpc" "cluster" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {Name = "cluster"}
}
resource "aws_internet_gateway" "igwa" {
  vpc_id = aws_vpc.cluster.id

  tags = {Name = "igwa"}
}
resource "aws_subnet" "public-1" {

  vpc_id = aws_vpc.cluster.id
  cidr_block = "10.0.1.0/24"
  tags = {Name= "public-1"}
}
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.cluster.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwa.id
  }
  tags = {
    Name = "rt1"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public-1.id
  route_table_id = aws_route_table.rt1.id
  
}

resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  vpc_id = aws_vpc.cluster.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
        cidr_blocks      = ["0.0.0.0/0"]

  }
  
}
resource "aws_instance" "first-terraform" {
    ami = var.ami_id
instance_type = var.instance_type
key_name = var.key_name
subnet_id = aws_subnet.public-1.id
vpc_security_group_ids = [aws_security_group.allow-ssh.id]
tags = {Name= var.instance_name }
   associate_public_ip_address = true
}