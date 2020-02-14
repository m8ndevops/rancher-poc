provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_security_group_rule" "rule" {
  count = "${var.self == true  ? 0 : 1}"
  from_port = "${var.from-port}"
  protocol = "${var.protocol}"
  security_group_id = "${var.sg-id}"
  to_port = "${var.to-port}"
  type = "${var.connection-type}"
  cidr_blocks = "${var.cidr-block}"

}

resource "aws_security_group_rule" "rule1" {
  count = "${var.self == true  ? 1 : 0}"
  from_port = "${var.from-port}"
  protocol = "${var.protocol}"
  security_group_id = "${var.sg-id}"
  to_port = "${var.to-port}"
  type = "${var.connection-type}"
  self = true
}