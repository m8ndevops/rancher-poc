provider "rancher2" {
  alias = "rancher"
  api_url = "${var.api_key}"
  token_key = "${var.token}"
  insecure = true
}

resource "rancher2_node_template" "node_template" {
  provider = "rancher2.rancher"
  name = "${var.name}"
  description = "Node template for ${var.name} in ${var.env} environment"
  cloud_credential_id = "${var.credentials}"
  amazonec2_config {
    ami =  "${var.ami}"
    region = "${var.region}"
    security_group = ["${var.sg_grp}"]
    subnet_id = "${var.subnet_id}"
    vpc_id = "${var.vpc_id}"
    zone = "${var.zone}"
    instance_type = "${var.instance_type}"
    root_size = "${var.root_volume_size}"
    iam_instance_profile = "${var.iam_instance_profile}"
  }
  labels = {
    "finoptsys.node.role" = "${var.node_label}"
  }
}