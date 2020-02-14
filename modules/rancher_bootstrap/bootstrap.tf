provider "rancher2" {
  api_url   = "${var.rancher_url}"
  bootstrap = "${var.bootstrap}"
  insecure = "${var.insecure_https}"
}

# Create a new rancher2_bootstrap
resource "rancher2_bootstrap" "admin" {
  count = "${var.current_pass == ""  ? 1 : 0}"
  password = "${var.password}"
  telemetry = "${var.telemetry}"
  token_ttl ="${var.token_ttl}"
  token_update = "${var.token_update}"
}

resource "rancher2_bootstrap" "admin1" {
  count = "${var.current_pass == ""  ? 0 : 1}"
  password = "${var.password}"
  current_password = "${var.current_pass}"
  telemetry = "${var.telemetry}"
  token_ttl ="${var.token_ttl}"
  token_update = "${var.token_update}"
}