#Each module will have its own variables.

variable "api_key" {}
variable "token" {}
variable "env" {}

variable "cluster_name" {}
variable "network_plugin" {
  default = "canal"
}
variable "cluster_monitoring" {
  default = true
}
variable "cluster_alerting" {
  default = true
}
//variable "private_dns_namespace_name" {
//  type = "string"
//}

//variable "vpc_id" {}