provider "aws" {
    region = "ap-southeast-2"  
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "kushitha01184"
  acl    = "private"
  tags = {
      Name = "My s3 bucket"
  }
}
