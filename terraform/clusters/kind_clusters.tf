provider "kind" {
}

provider "kubernetes" {
  alias                  = "infracluster"
  config_path = var.kind_cluster_config_path
}

provider "kubernetes" {
  alias                  = "appcluster"
  config_path = var.kind_cluster_config_path
}


resource "kind_cluster" "infra" {
  name            = var.kind_cluster_infra_name
  kubeconfig_path = pathexpand(var.kind_cluster_config_path)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    
    networking {
        api_server_address = "127.0.0.1"
        api_server_port = 6443
    }
    node {
      role = "control-plane"
      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]
    extra_port_mappings {
        container_port = 9000
        host_port      = 9000
      }
    extra_port_mappings {
        container_port = 9090
        host_port      = 9090
      }
    }

    node {
      role = "worker"
    }
  }
}

resource "kind_cluster" "application" {

  name            = var.kind_cluster_app_name
  kubeconfig_path = pathexpand(var.kind_cluster_config_path)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    networking {
        api_server_address = "127.0.0.1"
        api_server_port = 6444
    }
    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]
      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }

    node {
      role = "worker"
    }
  }
}

output "infra_cluster_ip" {
  value = "${kind_cluster.infra.endpoint}"
}

output "app_cluster_ip" {
  value = "${kind_cluster.application.endpoint}"
}