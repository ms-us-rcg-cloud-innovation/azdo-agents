locals {
  operating_system = lower(var.operating_system)
}

resource "azurerm_container_registry_task" "example" {
  name                  = var.name
  container_registry_id = var.container_registry_id

  platform {
    os = title(local.operating_system)
  }

  docker_step {
    dockerfile_path      = "Dockerfile.${local.operating_system}"
    context_path         = var.git_repo_url
    context_access_token = var.git_repo_access_token
    image_names          = ["azdo-agent:${local.operating_system}-{{.Run.ID}}"]
  }
}