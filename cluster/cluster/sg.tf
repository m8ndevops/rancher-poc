module "rancher_node_sg" {
  source = "../../modules/sg"
  env = "${var.env}"
  profile = "${var.profile}"
  project_name = "${var.project-name}"
  region = "${var.region}"
  sg-name = "rancher-node-sg"
  vpc_id = "${module.vpc.vpc_id}"
}

module "inbound80" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "80"
   from-port = "80"
  self = false

}

module "inbound6443" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "6443"
   from-port = "6443"
  self = false
}

module "inbound22" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "22"
   from-port = "22"
  self = false
}

module "inbound3XXXX" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "udp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "32767"
   from-port = "30000"
  self = false
}
module "inbound3XXX" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "32767"
   from-port = "30000"
  self = false
}

module "inbound23XX" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "2380"
   from-port = "2379"
  self = true
}

module "inbound10256" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "10256"
   from-port = "10256"
  self = true
}

module "inbound4789" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "udp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "4789"
   from-port = "4789"
   self = true
}

module "inbound8472" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "udp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "8472"
   from-port = "8472"
   self = true
}

module "inbound102XX" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "10252"
   from-port = "10250"
  self = true
}

module "inbound2376" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "2376"
   from-port = "2376"
  self = false
}
module "inbound443" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "443"
   from-port = "443"
  self = false
}



module "outbound" {
   source	=	"../../modules/sg-rule"
   connection-type = "egress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "-1"
   sg-id = "${module.rancher_node_sg.sg_id}"
   to-port = "0"
   from-port = "0"
  self = false

}

