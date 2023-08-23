
provider "aws" {
    region = "ap-southeast-2"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0a709bebf4fa9246f" # ap-southeast-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
