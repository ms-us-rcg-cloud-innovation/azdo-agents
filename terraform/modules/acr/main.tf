resource "azurerm_container_registry" "default" {
  resource_group_name = var.resource_group_name
  location            = var.location

  name                    = var.name
  sku                     = var.sku
  admin_enabled           = false
  zone_redundancy_enabled = true
}

resource "azurerm_container_registry_agent_pool" "default" {
  name                    = "default"
  resource_group_name     = var.resource_group_name
  location                = var.location
  container_registry_name = azurerm_container_registry.default.name
}