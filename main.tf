provider "aws" {
  region = "ap-south-1" 
  }

resource "aws_s3_bucket" "terraform-bucket-demo" {
  bucket = "terraform-bucketdemo-123345"  // Replace with your desired bucket name
  acl    = "private"
  tags = {
    Name = "Example Bucket"
  }
}
