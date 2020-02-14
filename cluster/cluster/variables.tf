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

variable "availability-zones" {}
variable "number_of_masters" {
  default = 1
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "number_of_nodes" {}

