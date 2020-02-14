variable "region" {}

variable "env" {}

variable "profile" {}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {
  type = "list"
}
variable "private_subnet_cidr" {
  type = "list"
}

variable "project-name" {}


variable "ec2-key-name" {}

variable "availability-zones" {}


