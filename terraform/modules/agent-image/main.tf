resource "azurerm_container_registry_task" "example" {
  name                  = var.name
  container_registry_id = var.container_registry_id
  platform {
    os = var.operating_system
  }
  
  docker_step {
    dockerfile_path      = "docker/Dockerfile.${var.operating_system}"
    context_path         = var.git_repo_url
    context_access_token = "<github personal access token>"
    image_names          = ["helloworld:{{.Run.ID}}"]
  }
}