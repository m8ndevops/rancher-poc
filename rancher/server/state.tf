terraform {
  backend "s3" {
    bucket  = "meetup.infra"
    key     = "rancher/terraform.tfstate"
    profile = "meetup"
    region  = "ap-south-1"
    encrypt = true
  }
}
