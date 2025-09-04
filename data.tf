# Filter out local zones, which are not currently supported 
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# https://aws.amazon.com/blogs/containers/amazon-ebs-csi-driver-is-now-generally-available-in-amazon-eks-add-ons/ 
data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

# to get the authentication-token
data "aws_eks_cluster_auth" "cluster_auth" {
  name = module.eks.cluster_name
}

# code that ouput the "dev-ingress" and "prod-ingress" controllers "hostname"
data "kubernetes_service" "dev_ingress" {
  metadata {
    name      = "dev-ingress-ingress-nginx-controller"
    namespace = "dev-ns"
  }

  depends_on = [ 
    null_resource.configure-dev-and-prod-infra
   ]

}

data "kubernetes_service" "prod_ingress" {
  metadata {
    name      = "prod-ingress-ingress-nginx-controller"
    namespace = "prod-ns"
  }
   depends_on = [ 
    null_resource.configure-dev-and-prod-infra
   ]
}

