# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    dynamodb_table = "prod-ekscluster"
    bucket = "tf-aws-state-file"
    key    = "prod/eks-cluster/terraform.tfstate"
    region = "ap-south-1"
  }
}

locals {
  environment = terraform.workspace
}