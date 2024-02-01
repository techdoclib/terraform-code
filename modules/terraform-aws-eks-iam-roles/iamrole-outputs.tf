output "eks_master_role" {
  value =  aws_iam_role.eks_master_role.arn
}


output "eks-AmazonEKSVPCResourceController" {
  value = aws_iam_role_policy_attachment.eks-iam-AmazonEKSClusterPolicy
}

output "eks-AmazonEKSClusterPolicy" {
  value = aws_iam_role_policy_attachment.eks-iam-AmazonEKSClusterPolicy
}

output "out-eks-AmazonEKSWorkerNodePolicy" {
  value = aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy
}

output "out-eks-AmazonEKS_CNI_Policy" {
  value = aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy
}

output "out-eks-AmazonEC2ContainerRegistryReadOnly" {
  value = aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly
}

output "out_ng_eks_nodegroup_role_arn" {
  value =  aws_iam_role.eks_nodegroup_role.arn
}