output "rancher_url" {
  value = "${rancher2_bootstrap.admin.*.url[0]}"
}

output "rancher_token_id" {
  value = "${rancher2_bootstrap.admin.*.token_id[0]}"
}

output "rancher_token" {
  value = "${rancher2_bootstrap.admin.*.token[0]}"
}