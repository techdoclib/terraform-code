terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      #version = ">= 5.20"
    }
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