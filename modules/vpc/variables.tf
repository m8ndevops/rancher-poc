#Each module will have its own variables.

variable "project_name" {
  description = "VPC name, like staging and production etc."
}

variable "origin" {
  description = "origin for this account"
}

variable "env" {
  description = "Environment name, staging-000, production-000 etc."
}

variable "cidr" {
  description = "The CIDR block for the VPC."
#  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets CIDR blocks"
  type        = "list"
  default     = []
}

//variable "s3_bucket_name" {}
variable "private_subnets" {
  description = "List of private subnets CIDR blocks"
  type        = "list"
  default     = []
}

variable "azs" {
  description = "Comma separated lists of AZs in which to distribute subnets"
#  default     = "us-west-2a,us-west-2b,us-west-2c"
}

variable "enable_dns_hostnames" {
  description = "True or False to enable/diasbale the DNS hostnames in VPC."
  default     = true
}

variable "enable_dns_support" {
  description = "True or False to enable/disable the DNS support in VPC."
  default     = true
}

variable "region" {
  description = "AWS region where the infrastructure will come up."
}

variable "nat_gateways_count" {
  description = "NAT Gateway to be created."
  default     = 1
}

variable "public_zone_create" {
  description = "True or False to enable/disable public hosted zone"
  default     = false
}

variable "private_zone_create" {
  description = "True or False to enable/disable public route53 zone"
  default     = false
}
variable "profile" {}

variable "enable_private_subnet" {}

# variable "zone_id_private" {
#   description = "The zone_id of the route53 private zone where to create dns records"
#   default     = ""
# }

#variable "alb_public_ranges" {
#  description = "List of ALB subnets CIDR blocks passed as string"
#  default     = ""
#}

#variable "db_subnets" {
#  description = "List of db subnets CIDR blocks"
#  type        = "list"
#  default     = []
#}

#variable "s3_enpoint_enabled" {
#  description = "True or False to enable/disable S3 endpoint is enabled inside the VPC"
#  default     = false
#}


## Flow log parameters
#variable "flow_log_traffic_type" {
#  description = "Valid values: ACCEPT,REJECT,ALL"
#  default     = "REJECT"
#}

#variable "flow_log_enabled" {
#  description = "True or False to enable/disable flow logs for VPC"
#  default     = true
#}

#variable "flow_log_days" {
#  description = "How many days to keep the flow logs in cloudwatch logs"
#  default     = 7
#}

