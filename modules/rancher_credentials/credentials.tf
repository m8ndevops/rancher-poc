provider "rancher2" {
  api_url = "${var.api_key}"
  token_key = "${var.token}"
  insecure = true
}

resource "rancher2_cloud_credential" "credentials" {
  name = "${var.name}"
  description = "This is ${var.env} AWS cloud credentials"
  amazonec2_credential_config {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
  }
}