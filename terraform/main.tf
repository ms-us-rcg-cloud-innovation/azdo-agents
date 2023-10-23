resource "azurerm_resource_group" "azdo_agents" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_pet" "prefix" {}
resource "random_string" "name" {
  length  = 8
  special = false
  lower   = true
  upper   = false
}

module "aks" {
  source              = "./modules/aks"
  dns_prefix          = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.azdo_agents.location
  resource_group_name = azurerm_resource_group.azdo_agents.name
}

module "acr" {
  source              = "./modules/acr"
  name                = "agents${random_string.name.result}"
  location            = azurerm_resource_group.azdo_agents.location
  resource_group_name = azurerm_resource_group.azdo_agents.name
}

module "agent_image_linux" {
  source                = "./modules/agent-image"
  name                  = "azdo-agent-linux"
  container_registry_id = module.acr.container_registry_id
  operating_system      = "linux"
  git_repo_url          = var.agent_image_context_git_repo_url
  git_repo_access_token = var.agent_image_context_git_repo_access_token
}


module "aks_agent_linux" {
  source                 = "./modules/aks-agent"
  cluster_ca_certificate = module.aks.cluster_ca_certificate
  client_certificate     = module.aks.client_certificate
  client_key             = module.aks.client_key
  host                   = module.aks.host
  password               = module.aks.password
  username               = module.aks.username

  azdo_personal_access_token = var.azure_devops_personal_access_token
  azdo_agent_pool_name       = var.azdo_agent_pool_name
  azdo_org_url               = var.azdo_org_url
  agent_image                = ""
  agent_name                 = "azdo-agent"
}