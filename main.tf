provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  count = 2
  
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-east-1" # Change to the desired AZ
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public Subnet ${count.index}"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My Internet Gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_associations" {
  count = 2
  
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}
