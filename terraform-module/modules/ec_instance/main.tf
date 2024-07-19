provider "aws" {
  region = "ap-south-1"
}

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}

locals {
  my_ip=jsondecode(data.http.my_ip.body)["ip"]
}
variable "ami" {
    type = string
    description = "AMI id"
}
variable "instance_type"{
    type=string
    description="Type of instance"
}
variable "subnetid"{
    type=string
    description="Subnet id of instance"
}

# resource "aws_instance" "demo" {
#   ami = var.ami
#   instance_type = var.instance_type
#   subnet_id = var.subnetid
# }

resource "aws_security_group_rule" "newrule" {
  security_group_id = "sg-05fb26c498c8f6e11"
  protocol = "tcp"
  from_port = 5000
  to_port = 5000
  cidr_blocks = ["${local.my_ip}/32"]
  type = "ingress"
}