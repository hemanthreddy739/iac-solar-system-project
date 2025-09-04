# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}




output "dev_ingress_external_ip" {
  description = "The external IP address/hostname of the dev-ingress-nginx controller."
  value       = data.kubernetes_service.dev_ingress.status[0].load_balancer[0].ingress[0].hostname
}

output "prod_ingress_external_ip" {
  description = "The external IP address/hostname of the prod-ingress-nginx controller."
  value       = data.kubernetes_service.prod_ingress.status[0].load_balancer[0].ingress[0].hostname
}