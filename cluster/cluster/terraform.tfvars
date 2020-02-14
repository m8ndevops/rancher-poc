region = "ap-south-1"
env = "meetup"
//name = "dev"
profile = "meetup"
project-name = "meetup"
vpc_cidr = "172.35.0.0/16"
availability-zones="ap-south-1a,ap-south-1b"
public_subnet_cidr = ["172.35.0.0/24", "172.35.1.0/24"]
private_subnet_cidr = ["172.35.2.0/24" , "172.35.3.0/24"]


## AWS Cred
aws_access_key = ""
aws_secret_key = ""


### K8s config
number_of_masters=1
number_of_nodes=1

