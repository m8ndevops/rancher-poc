#Each module will have its own variables.

variable "api_key" {}
variable "token" {}
variable "env" {}
variable "name" {}

variable "credentials" {}
variable "ami" {}
variable "region" {}
variable "sg_grp" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "zone" {}
variable "instance_type" {}
variable "root_volume_size" {}
variable "iam_instance_profile" {
  default = "ecsInstanceRole"
}
variable "node_label" {}

//variable "private_dns_namespace_name" {
//  type = "string"
//}

//variable "vpc_id" {}