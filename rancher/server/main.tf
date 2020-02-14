
module "vpc" {
  source          = "../../modules/vpc"
  project_name    = "${var.project-name}"
  env             = "${var.env}"
  cidr            = "${var.vpc_cidr}"
  public_subnets  = "${var.public_subnet_cidr}"
  private_subnets = "${var.private_subnet_cidr}"
  origin = "${var.project-name}"
  azs =  "${var.availability-zones}"

  region             = "${var.region}"
  nat_gateways_count = 1
  profile = "${var.profile}"
  enable_private_subnet = "false"
}

module "security_groups" {
  source	=	"../../modules/sg"
  sg-name = "rancher-sg"
  env		= 	"${var.env}"
  region	= 	"${var.region}"
  project_name = "${var.project-name}"
  vpc_id	= 	"${module.vpc.vpc_id}"
  profile = "${var.profile}"

}

module "inbound443" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.security_groups.sg_id}"
   to-port = "443"
   from-port = "443"
   self = false
}

module "inbound22" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.security_groups.sg_id}"
   to-port = "22"
   from-port = "22"
  self = false

}

module "inbound80" {
   source	=	"../../modules/sg-rule"
   connection-type = "ingress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "tcp"
   sg-id = "${module.security_groups.sg_id}"
   to-port = "80"
   from-port = "80"
   self = false
}
module "outbound" {
   source	=	"../../modules/sg-rule"
   connection-type = "egress"
   env = "${var.env}"
   profile = "${var.profile}"
   region = "${var.region}"
   protocol = "-1"
   sg-id = "${module.security_groups.sg_id}"
   to-port = "0"
   from-port = "0"
  self = false

}


module "rancher_server" {
  source = "../../modules/instances"
  ami = "ami-0620d12a9cf777c87"  ## ubuntu 18.04
  env = "${var.env}"
  profile = "${var.profile}"
  region = "${var.region}"
  instance_type = "t3.medium"
  key_name = "${var.ec2-key-name}"
  name = "rancher-server"
  security_groups = "${module.security_groups.sg_id}"
  subnet_id = "${element(module.vpc.public_subnets,0)}"
  root_block_volume_size = 100

}
