# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}

variable "business_divsion" {
  default = "and"
}
variable "environment" {
  default = "prod"
}
variable "cluster_name" {
  default = "andsvc"
}