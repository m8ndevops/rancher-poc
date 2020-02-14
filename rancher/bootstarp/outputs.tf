output "server_token" {
  value = "${module.rancher_bootstrap.rancher_token}"
}

output "server_url" {
  value = "${module.rancher_bootstrap.rancher_url}"
}

output "server_token_id" {
  value = "${module.rancher_bootstrap.rancher_token_id}"
}