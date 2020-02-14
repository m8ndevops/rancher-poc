#Output from the Module to get in statefile so that we can reference it later                          #
#------------------------------------------------------------------------------------------------------#

output "cluster_id" {
  value = "${rancher2_cluster.cluster.id}"
}

