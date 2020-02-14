variable "rancher_url" {}
variable "current_pass" {}
variable "bootstrap" {
  default = true
}
variable "password" {}
variable "telemetry" {
  default = true
}
variable "token_ttl" {
  default = "2592000"
}
variable "token_update" {
  default = true
}
variable "insecure_https" {
  default = true
}
