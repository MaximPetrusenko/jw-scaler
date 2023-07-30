terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.9"
    }

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

    kubectl = {
      source  = "registry.terraform.io/gavinbunney/kubectl"
      version = ">= 1.10.0"
    }


  }

  required_version = ">= 1.0.0"
}