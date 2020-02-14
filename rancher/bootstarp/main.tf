
module "rancher_bootstrap" {
  source          = "../../modules/rancher_bootstrap"
  password = "${var.password}"
  rancher_url = "${var.rancher_url}"
  current_pass = ""
}


