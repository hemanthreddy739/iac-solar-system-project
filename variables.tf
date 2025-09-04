variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_version" {
  description = "k8s cluster version"
  type = string
  default = "1.33"
}

variable "vpc_name" {
  description = "vpc-name"
  type = string
  default = "solar-system"
}


variable "eks_cluster_name" {
  description = "provide the eks cluster name"
  type = string
  default = "solar-system"
}