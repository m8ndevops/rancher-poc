terraform {
  backend "s3" {
    bucket  = "meetup.infra"
    key     = "cluster/vpc/terraform.tfstate"
    profile = "meetup"
    region  = "ap-south-1"
    encrypt = true
  }
}
