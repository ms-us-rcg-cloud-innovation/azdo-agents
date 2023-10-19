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
}