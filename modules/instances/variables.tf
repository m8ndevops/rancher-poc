#Each module will have its own variables.

variable "name" {
  description = "VPC name, like staging and production etc."
  type = "string"
}

variable "env" {
  description = "Environment name, staging-000, production-000 etc."
}

variable "ami" {
  description = "The ami id of the instance "
}

variable "instance_type" {
  description = "Instance type to launch"
}

variable "associate_public_ip" {
  description = "Whether to associate public ip with the instance"
  default     = true
}

variable "key_name" {
  description = "SSH key name"
#  default     = "us-west-2a,us-west-2b,us-west-2c"
}

variable "security_groups" {
  description = "The security groups to be associated with the instance"
  type = "string"

}

variable "subnet_id" {
  description = "The subnet ID for the instance"
  type = "string"
}

variable "root_block_volume_type" {
  description = "Root Volume type"
  default     = "gp2"
}

variable "root_block_volume_size" {
  description = "Root Volume Size"
  default = 20

}

variable "iam_instance_profile" {
  description = "The IAM role to attach with instance."
  default     = ""
}

variable "region" {}
variable "profile" {}


