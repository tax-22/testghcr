provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  type = string
}
variable "subnetid" {
  type = string
}
variable "instance_type" {
  type = string
}

module "ec_instance" {
    source = "./modules/ec_instance"
    ami = var.ami
    instance_type = var.instance_type
    subnetid = var.subnetid
}