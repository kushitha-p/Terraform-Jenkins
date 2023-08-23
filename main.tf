provider "aws" {
  region = "ap-southeast-2"  
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "my_subnet" {
  count = 2
  cidr_block = "10.0.${count.index}.0/24"
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MySubnet-${count.index}"
  }
}

resource "aws_security_group" "my_sg" {
  name_prefix = "MySG-"
  vpc_id = aws_vpc.my_vpc.id

  // Define your security group rules here
  // Example:
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
