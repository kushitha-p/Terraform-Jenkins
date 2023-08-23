provider "aws" {
    region = "ap-southeast-1"  
}

resource "aws_instance" "foo" {
  ami           = "0310483fb2b488153" # ap-southeast-1
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
