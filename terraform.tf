
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.0"
    }
  }

  required_version = "~> 1.13.0"
}