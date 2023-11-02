variable "location" {
  type = string

  default = "eastus"
}

variable "resource_group_name" {
  type    = string
  default = "azdo-agents"
}

variable "azure_devops_personal_access_token" {
  type      = string
  sensitive = true
}

variable "azdo_agent_pool_name" {
  type    = string
  default = "azdo-agents"
}

variable "azdo_org_url" {
  type    = string
  default = "https://dev.azure.com/rcgsquads"
}

variable "agent_image_context_git_repo_access_token" {
  type      = string
  sensitive = true
}

variable "agent_image_context_git_repo_url" {
  type    = string
  default = "https://github.com/ms-us-rcg-cloud-innovation/azdo-agents#main:docker"
}

variable "agent_image" {
  type    = string
  default = "agentshu3ks6f9.azurecr.io/azdo-agent:linux-ca3"
}