data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  iam_role_name = aws_iam_role.node_instance_role.name

  vpc_id                         = var.vpc_id
  subnet_ids                     = [var.private_subnet_1_id, var.private_subnet_2_id]
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type
  }

  eks_managed_node_groups = {
    pipeline_node_group = {
      name = var.pipeline_ng_name

      instance_types = [var.pipeline_ng_instance_type]

      min_size     = var.pipeline_ng_min_size
      max_size     = var.pipeline_ng_max_size
      desired_size = var.pipeline_ng_desired_size

      disk_size = var.pipeline_ng_disk_size

      labels = {
        role = "pipeline"
      }

      iam_instance_profile_name = var.use_node_instance_role ? [aws_iam_role.node_instance_role.name] : []

      tags = {
        role = "pipeline"
      }
    }

    service_node_group = {
      name = var.service_ng_name

      instance_types = [var.service_ng_instance_type]

      min_size     = var.service_ng_min_size
      max_size     = var.service_ng_max_size
      desired_size = var.service_ng_desired_size

      disk_size = var.service_ng_disk_size

      labels = {
        role = "service"
      }

      iam_instance_profile_name = var.use_node_instance_role ? [aws_iam_role.node_instance_role.name] : []

      tags = {
        role = "service"
      }
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