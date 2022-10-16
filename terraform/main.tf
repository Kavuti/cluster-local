resource "kind_cluster" "cluster_local" {
  name           = var.cluster_name
  wait_for_ready = true
  node_image     = format("kindest/node:%s", var.kubernetes_version)
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

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
  }
}

resource "shell_script" "flux_sync" {
  lifecycle_commands {
    create = file("${path.module}/scripts/create.sh")
    read   = file("${path.module}/scripts/read.sh")
    update = file("${path.module}/scripts/update.sh")
    delete = file("${path.module}/scripts/delete.sh")
  }

  environment = {
    CLUSTER_LOCAL_PATH = var.target_path
    CLUSTER_LOCAL_NAME = "kind-${kind_cluster.cluster_local.name}"
    CLUSTER_LOCAL_GITHUB_OWNER = var.github_owner
    CLUSTER_LOCAL_GITHUB_REPOSITORY = var.repository_name
    CLUSTER_LOCAL_GITHUB_REPOSITORY_PRIVATE = var.private_repository
    CLUSTER_LOCAL_GITHUB_REPOSITORY_BRANCH = var.branch
  }

  sensitive_environment = {
    GITHUB_TOKEN = var.github_token
  }

  depends_on = [
    kind_cluster.cluster_local
  ]
}
