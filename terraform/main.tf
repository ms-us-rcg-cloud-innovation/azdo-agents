resource "azurerm_resource_group" "azdo_agents" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_pet" "prefix" {}

module "aks" {
  source              = "./modules/aks"
  dns_prefix          = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.azdo_agents.location
  resource_group_name = azurerm_resource_group.azdo_agents.name
}

module "acr"{
    source = "./module/acr"    
    location = azurerm_resource_group.azdo_agents.location
    resource_group_name = azurerm_resource_group.azdo_agents.name
}

module "aks-agent" {
  source                = "./modules/aks-agent"
  cluster_ca_certificate = module.aks.client_ca_certificate
  client_certificate    = module.aks.client_certificate
  client_key            = module.aks.client_key
  host                  = module.aks.host
  password              = module.aks.password
  username              = module.aks.username

  azdo_personal_access_token = ""
  agent_image = ""
  agent_name = "azdo-agent"
}