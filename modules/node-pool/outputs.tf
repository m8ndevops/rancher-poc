#Output from the Module to get in statefile so that we can reference it later                          #
#------------------------------------------------------------------------------------------------------#

output "node_pool_id" {
  value = "${rancher2_node_pool.node_pool.id}"
}

