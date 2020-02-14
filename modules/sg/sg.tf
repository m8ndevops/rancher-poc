provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}


resource "aws_security_group" "aws-SG" {
  tags = {
    Name = "${var.sg-name}"
  }

  name = "${var.sg-name}"
  description = "${var.sg-name} security groups for ${var.env} environment"
  vpc_id = "${var.vpc_id}"


}