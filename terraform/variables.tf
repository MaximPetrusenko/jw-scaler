variable "kind_cluster_app_name" {
  type        = string
  description = "The name of the cluster."
  default     = "application-local"
}

variable "kind_cluster_infra_name" {
  type        = string
  description = "The name of the cluster."
  default     = "infrastructure-local"
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}
