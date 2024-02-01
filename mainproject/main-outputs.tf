
output "out_aws_eks_cluster_name" {
  value = module.aws-eks-cluster.out_aws_eks_cluster_name
}

output "out_url" {

# value             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  value = module.aws-eks-cluster.out_url
}


output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = module.aws-eks-cluster.cluster_id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = module.aws-eks-cluster.cluster_arn
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = module.aws-eks-cluster.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = module.aws-eks-cluster.cluster_endpoint
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = module.aws-eks-cluster.cluster_version
}


output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  value       = module.aws-eks-cluster.cluster_oidc_issuer_url
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value       = module.aws-eks-cluster.cluster_primary_security_group_id
}


# Output: AWS IAM Open ID Connect Provider ARN
output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
 # value = aws_iam_openid_connect_provider.oidc_provider.arn
  value = module.aws-eks-cluster-oidc.aws_iam_openid_connect_provider_arn
}



# Output: AWS IAM Open ID Connect Provider
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  #value = local.aws_iam_oidc_connect_provider_extract_from_arn
  value = module.aws-eks-cluster-oidc.aws_iam_openid_connect_provider_extract_from_arn
}


# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.aws-eks-vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.aws-eks-vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.aws-eks-vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.aws-eks-vpc.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.aws-eks-vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.aws-eks-vpc.azs
}