#Output from the Module to get in statefile so that we can reference it later                          #
#------------------------------------------------------------------------------------------------------#

output "node_template_id" {
  value = "${rancher2_node_template.node_template.id}"
}

