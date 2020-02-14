provider "rancher2" {
  api_url = "${var.api_key}"
  token_key = "${var.token}"
  insecure = true
}

resource "rancher2_node_pool" "node_pool" {
  cluster_id =  "${var.cluster_id}"
  name = "${var.name}"
  hostname_prefix =  "${var.hostname-prefix}"
  node_template_id = "${var.template_id}"
  quantity = "${var.quantity}"
  control_plane = "${var.control_plane}"
  etcd = "${var.etcd}"
  worker = "${var.worker}"
  labels = {
    "finoptsys.node.role" = "${var.node_label}"
  }
}