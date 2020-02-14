variable "to-port" {}
variable "from-port" {}
variable "sg-id" {}
variable "protocol" {}
variable "connection-type" {}
variable "cidr-block" {
  type        = "list"
  default = ["0.0.0.0/0"]
}
variable "env" {}

variable "region" {}
variable "self" {}
variable "profile" {}