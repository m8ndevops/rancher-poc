provider "rancher2" {
  alias = "rancher"
  api_url = "${var.api_key}"
  token_key = "${var.token}"
  insecure = true
}
resource "rancher2_cluster" "cluster" {
  provider = "rancher2.rancher"
  name = "${var.cluster_name}"

  description = "This is a k8s cluster for ${var.env}"
  rke_config {
    cloud_provider {
      name = "aws"
      aws_cloud_provider {
      }
    }
    network {
      plugin = "${var.network_plugin}"
    }
    ingress {
      provider = "none"
    }
  }
  enable_cluster_monitoring = "${var.cluster_monitoring}"
  enable_cluster_alerting = "${var.cluster_alerting}"
//  cluster_monitoring_input  {
//    answers = {
//      "exporter-kubelets.https" = true
//      "exporter-node.enabled" = true
//      "exporter-node.ports.metrics.port" = 9796
//      "exporter-node.resources.limits.cpu" = "200m"
//      "exporter-node.resources.limits.memory" = "200Mi"
//      "grafana.persistence.enabled" = false
//      "grafana.persistence.size" = "10Gi"
//      "grafana.persistence.storageClass" = "default"
//      "operator.resources.limits.memory" = "500Mi"
//      "prometheus.persistence.enabled" = "false"
//      "prometheus.persistence.size" = "50Gi"
//      "prometheus.persistence.storageClass" = "default"
//      "prometheus.persistent.useReleaseName" = "true"
//      "prometheus.resources.core.limits.cpu" = "1000m",
//      "prometheus.resources.core.limits.memory" = "1500Mi"
//      "prometheus.resources.core.requests.cpu" = "750m"
//      "prometheus.resources.core.requests.memory" = "750Mi"
//      "prometheus.retention" = "12h"
//    }
//  }

}