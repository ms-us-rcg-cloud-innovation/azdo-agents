variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the AKS cluster will be created"
}

variable "location" {
  type        = string
  description = "Location of the resource group where the AKS cluster will be created"
  default     = "eastus"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = "agents"
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.26.3"
}

variable "agent_pool_name" {
  type    = string
  default = "agentpool"
}

variable "agent_pool_count" {
  type    = number
  default = 1
}

variable "agent_pool_vm_size" {
  type    = string
  default = "Standard_D2_v2"
}