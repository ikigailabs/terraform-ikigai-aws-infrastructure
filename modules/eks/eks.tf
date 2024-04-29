data "aws_vpc" "ikigai_vpc" {
  tags = {
    "Name" = var.vpc_name
  }
}

data "aws_subnet" "eks_private_1" {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.eks_subnet_name_1
  }
}

data "aws_subnet" "eks_private_2"  {
  vpc_id = data.aws_vpc.ikigai_vpc.id
  tags = {
    "Name" = var.eks_subnet_name_2
  }
}

data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}



module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id                         = data.aws_vpc.ikigai_vpc.id
  subnet_ids                     = [data.aws_subnet.eks_private_1.id, data.aws_subnet.eks_private_2.id]
  cluster_endpoint_public_access = false

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type
  }

  eks_managed_node_groups = {
    pipeline = {
      name = var.pipeline_ng_name

      instance_types = [var.pipeline_ng_instance_type]

      min_size     = var.pipeline_ng_min_size
      max_size     = var.pipeline_ng_max_size
      desired_size = var.pipeline_ng_desired_size

      iam_instance_profile_name = var.use_node_instance_role ? [aws_iam_role.node_instance_role.name] : []
    }

    service = {
      name = var.service_ng_name

      instance_types = [var.service_ng_instance_type]

      min_size     = var.service_ng_min_size
      max_size     = var.service_ng_max_size
      desired_size = var.service_ng_desired_size

      iam_instance_profile_name = var.use_node_instance_role ? [aws_iam_role.node_instance_role.name] : []
    }
  }
}

module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}

resource "aws_eks_addon" "ebs-csi" {
  cluster_name             = module.eks.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.20.0-eksbuild.1"
  service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
  tags = {
    "eks_addon" = "ebs-csi"
    "terraform" = "true"
  }
}