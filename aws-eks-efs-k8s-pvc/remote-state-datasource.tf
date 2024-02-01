# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  //workspace = terraform.workspace
  config = {
    bucket = "tf-aws-state-file"
    key    = "prod/eks-cluster/terraform.tfstate"
    region = "ap-south-1"
  }
}

locals {
  environment = terraform.workspace
}



data "terraform_remote_state" "efs" {
  backend = "s3"
  //workspace = terraform.workspace
  config = {
    bucket = "tf-aws-state-file"
    key    = "prod/efs-resource/terraform.tfstate"
    region = "ap-south-1"
  }
}

