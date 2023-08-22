provider "aws" {
    region = "ap-southeast-2"  
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "kushitha8639"
  acl    = "public"

  tags = {
      Name = "My s3 bucket"
  }
}
