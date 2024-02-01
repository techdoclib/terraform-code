terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
    }
  }

  backend "s3" {

    bucket = "tf-aws-state-file"
    key    = "prod/eks-cluster/terraform.tfstate"
    region = "ap-south-1"

    # For State Locking
    dynamodb_table = "prod-ekscluster"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  profile = "eksadmin"

  assume_role {
    role_arn     = "arn:aws:iam::471112869423:role/eksadminrole"
    session_name = "eks-module-tf"

  }

}


