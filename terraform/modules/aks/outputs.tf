output "kube_config" {
  value = azurerm_kubernetes_cluster.default.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.host
}

output "username" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.default.kube_config.0.username
}

output "password" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.default.kube_config.0.password
}

output "client_certificate" {
  sensitive = true
  value     = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
}

output "client_key" {
  sensitive = true
  value     = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_key)
}

output "cluster_ca_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}