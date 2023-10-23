variable "host" {

}

variable "username" {
  sensitive = true
}

variable "password" {
  sensitive = true
}

variable "client_certificate" {
  sensitive = true
}

variable "client_key" {
  sensitive = true
}

variable "cluster_ca_certificate" {
  sensitive = true
}

variable "azdo_personal_access_token" {
  sensitive = true
  type      = string
}

variable "azdo_agent_pool_name" {
  type = string
}

variable "azdo_org_url" {
  type = string
}

variable "agent_name" {
  type    = string
  default = "azdo-agent"
}

variable "agent_image" {
  type    = string
  default = "mcr."
}