# Create AWS EKS Node Group - Private

resource "aws_eks_node_group" "eks_ng_private" {
  //cluster_name    = aws_eks_cluster.eks_cluster.name
  cluster_name = var.ng-cluster-name
  node_group_name = "${var.ng-cluster-name}-${var.business_divsion}-${var.environment}-${var.ng-name}"
  //node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  node_role_arn = var.ng_eks_nodegroup_role_arn
  //subnet_ids      = module.vpc.private_subnets
  subnet_ids      = var.ng_eks_private_subnets
  #version = var.cluster_version #(Optional: Defaults to EKS Cluster Kubernetes version)    
  
  /*
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t3.micro"]

*/

  ami_type       =  var.ami_type
  capacity_type  =  var.capacity_type
  disk_size      =  var.disk_size
  instance_types =  var.instance_types

  
  remote_access {
    ec2_ssh_key =  var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  # Desired max percentage of unavailable worker nodes during node group update.
   update_config {
    max_unavailable = var.max_unavailable
    #max_unavailable_percentage = 50    # ANY ONE TO USE
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
      var.ng_eks_AmazonEKSWorkerNodePolicy,
      var.ng_eks_AmazonEKS_CNI_Policy,
      var.ng_eks_AmazonEC2ContainerRegistryReadOnly
    /*
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly

    */
  ]  

}

