# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
    }
    helm = {
      source = "hashicorp/helm"
      #version = "2.4.1"
      #version = "~> 2.4"
      version = "~> 2.9"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      #version = "~> 2.1"
      version = "~> 3.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.11"
      version = ">= 2.20"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "tf-aws-state-file"
    key    = "prod/efs-resource/terraform.tfstate"
    region = "ap-south-1"

    # For State Locking
    dynamodb_table = "prod-efs-resource"
  }
}

# Terraform AWS Provider Block
provider "aws" {
  region = "ap-south-1"
  profile = "eksadmin"

  assume_role {
    role_arn     = "arn:aws:iam::471112869423:role/eksadminrole"
    session_name = "eks-module-tf"

  }

}
# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}