# https://keda.sh/blog/2021-05-27-azure-pipelines-scaler/
# https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#use-azure-kubernetes-service-cluster
resource "kubernetes_secret_v1" "pat" {
  metadata {
    name = "azdo-agent-pool-secret"
  }
  data = {
    AZP_TOKEN = var.azdo_personal_access_token
    AZP_POOL  = var.azdo_agent_pool_name
    AZP_URL   = var.azdo_org_url
  }
}

resource "kubernetes_deployment_v1" "name" {
  metadata {
    name = "azdo-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = var.agent_name
      }
    }
    template {
      metadata {
        labels = {
          "app" = var.agent_name
        }
      }
      spec {
        container {
          name  = var.agent_name
          image = var.agent_image
        }
      }
    }
  }
}