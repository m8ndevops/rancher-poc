
data "terraform_remote_state" "rancher" {
  backend = "s3"
  config = {
    bucket  = "meetup.infra"
    key     = "rancher_bootstrap/terraform.tfstate"
    profile = "meetup"
    region  = "ap-south-1"
  }
}

module "credentials" {
  source = "../../modules/rancher_credentials"
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  name = "meetup-credentials"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
}

module "vpc" {
  source          = "../../modules/vpc/"
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
  enable_private_subnet = false
}

provider "aws" {
  region = "ap-south-1"
}


module "k8s_cluster" {
  source = "../../modules/cluster"
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  cluster_name = "${var.env}"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
  cluster_monitoring = false
}


module "worker_node_template" {
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  name = "${var.env}-template"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
  source = "../../modules/node-template"
  ami = "ami-0620d12a9cf777c87"
  credentials = "${module.credentials.cred_id}"
  sg_grp = "${module.rancher_node_sg.sg_name}"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_id = "${module.vpc.public_subnets[0]}"
  instance_type = "t3.small"
  region = "${var.region}"
  zone = "a"
  root_volume_size = "50"
  node_label = "common"

}

module "master_node_template" {
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  name = "${var.env}-master-template"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
  source = "../../modules/node-template"
  ami = "ami-0620d12a9cf777c87"
  credentials = "${module.credentials.cred_id}"
  sg_grp = "${module.rancher_node_sg.sg_name}"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_id = "${module.vpc.public_subnets[0]}"
  instance_type = "t3.medium"
  region = "${var.region}"
  zone = "a"
  root_volume_size = "30"
  node_label = "master"

}

module "master_node" {
  source = "../../modules/node-pool"
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  name = "${var.env}-master"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
  cluster_id = "${module.k8s_cluster.cluster_id}"
  control_plane = true
  etcd = true
  worker = true
  hostname-prefix = "${var.env}-master-0"
  quantity = "${var.number_of_masters}"
  template_id = "${module.master_node_template.node_template_id}"
  node_label = "master"
}

module "node1" {
  source = "../../modules/node-pool"
  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
  env = "meetup"
  name = "${var.env}-node1"
  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
  cluster_id = "${module.k8s_cluster.cluster_id}"
  control_plane = false
  etcd = false
  worker = true
  hostname-prefix = "${var.env}-node1"
  quantity = "${var.number_of_nodes}"
  template_id = "${module.worker_node_template.node_template_id}"
  node_label = "node1"
}

//module "node2" {
//  source = "../../modules/node-pool"
//  api_key = "${data.terraform_remote_state.rancher.outputs.server_url}"
//  env = "meetup"
//  name = "${var.env}-node2"
//  token = "${data.terraform_remote_state.rancher.outputs.server_token}"
//  cluster_id = "${module.k8s_cluster.cluster_id}"
//  control_plane = false
//  etcd = false
//  worker = true
//  hostname-prefix = "${var.env}-node2"
//  quantity = 1
//  template_id = "${module.pms_node_template.node_template_id}"
//  node_label = "node2"
//}
