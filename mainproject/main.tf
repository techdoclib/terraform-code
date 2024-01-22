module "aws-eks-vpc" {
  source = "../modules/terraform-aws-eks-vpc"

}

module "aws-eks-iam-role" {
  source = "../modules/terraform-aws-eks-iam-roles"
}


module "aws-eks-ng-ami-ds" {
  source = "../modules/terraform-aws-eks-ng-ami"
}

module "aws-eks-cluster" {
  source = "../modules/terraform-aws-eks-cluster"
  eks-master-role = module.aws-eks-iam-role.eks_master_role
  eks-public-subnets = module.aws-eks-vpc.public_subnets
  eks-AmazonEKSClusterPolicy  =  module.aws-eks-iam-role.eks-AmazonEKSClusterPolicy
  eks-AmazonEKSVPCResourceController  =  module.aws-eks-iam-role.eks-AmazonEKSVPCResourceController
  cluster_name = var.cluster_name

}

module "aws-eks-cluster-node-group" {
  source = "../modules/terraform-aws-eks-ng-ec2"
  ng-cluster-name = module.aws-eks-cluster.out_aws_eks_cluster_name
  ng_eks_AmazonEC2ContainerRegistryReadOnly =  module.aws-eks-iam-role.out-eks-AmazonEC2ContainerRegistryReadOnly
  ng_eks_AmazonEKSWorkerNodePolicy =  module.aws-eks-iam-role.out-eks-AmazonEKSWorkerNodePolicy
  ng_eks_AmazonEKS_CNI_Policy =  module.aws-eks-iam-role.out-eks-AmazonEKS_CNI_Policy
  ng_eks_nodegroup_role_arn =  module.aws-eks-iam-role.out_ng_eks_nodegroup_role_arn
  ng_eks_private_subnets =  module.aws-eks-vpc.private_subnets
  ng-eks-master-role = module.aws-eks-iam-role.eks_master_role

  instance_types =  var.instance_types
  ng-name = "ng1"
}


module "aws-eks-cluster-node-group-analytics" {
  source = "../modules/terraform-aws-eks-ng-ec2"
  ng-cluster-name = module.aws-eks-cluster.out_aws_eks_cluster_name
  ng_eks_AmazonEC2ContainerRegistryReadOnly =  module.aws-eks-iam-role.out-eks-AmazonEC2ContainerRegistryReadOnly
  ng_eks_AmazonEKSWorkerNodePolicy =  module.aws-eks-iam-role.out-eks-AmazonEKSWorkerNodePolicy
  ng_eks_AmazonEKS_CNI_Policy =  module.aws-eks-iam-role.out-eks-AmazonEKS_CNI_Policy
  ng_eks_nodegroup_role_arn =  module.aws-eks-iam-role.out_ng_eks_nodegroup_role_arn
  ng_eks_private_subnets =  module.aws-eks-vpc.private_subnets
  ng-eks-master-role = module.aws-eks-iam-role.eks_master_role

  instance_types =  var.instance_types
  ng-name = "ng2"
}