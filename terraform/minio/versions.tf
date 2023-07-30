terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.5.0"
    }

    minio = {
      source = "aminueza/minio"
      version = "1.17.1"
    }


  }

  required_version = ">= 1.0.0"
}