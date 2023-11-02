resource "azurerm_kubernetes_cluster" "default" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = var.agent_pool_name
    node_count = var.agent_pool_count
    vm_size    = var.agent_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.default.id
  }
}

resource "azurerm_role_assignment" "pull" {
  principal_id                     = azurerm_kubernetes_cluster.default.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.azure_container_registry_id
  skip_service_principal_aad_check = true
}

resource "azurerm_log_analytics_workspace" "default" {
  name                = "agents"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}