resource "kubernetes_secret_v1" "pat" {
  metadata {
    name = "azdo-agent-pool-secret"
  }
  data = {
    AZP_TOKEN = var.azdo_personal_access_token
  }
}

resource "kubernetes_deployment_v1" "name" {
    metadata {
      
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
            name = var.agent_name
            image = var.agent_image        
          }
        }
      }
    }
}