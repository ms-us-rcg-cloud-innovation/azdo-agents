resource "azurerm_container_registry" "default" {
  name                = "${var.name}-acr"
  resource_group_name = var.resource_group_name

  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  georeplications {
    location                = var.secondary_location
    zone_redundancy_enabled = true
    tags                    = {}
  }
}