provider "aws" {
  region = "ap-south-1" 
  }

resource "aws_s3_bucket" "terraform_bucket_demo" {
  bucket = "terraform_bucket_demo"  // Replace with your desired bucket name
  acl    = "private"
  tags = {
    Name = "Example Bucket"
  }
}
