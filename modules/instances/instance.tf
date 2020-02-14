# Create AWS VPC
provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_instance" "instance" {
  tags = {
    #Name = "${var.region}-${var.env}"
    Name = "${var.name}"
    Environment  = "${var.env}"
  }
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "${var.associate_public_ip}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_groups}"]
  #subnet_id = "${element(var.subnet_id,0)}"
  subnet_id = "${var.subnet_id}"
  iam_instance_profile = "${var.iam_instance_profile}"
  root_block_device {
    volume_type = "${var.root_block_volume_type}"
    volume_size = "${var.root_block_volume_size}"
  }

}