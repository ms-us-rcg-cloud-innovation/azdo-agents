variable "resource_group_name" {
    type        = string
    description = "The name of the resource group where the container registry will be created."
}

variable "location"{
    type = string
    default = "East US"
    description = "primary location for geo replication"
}

variable "secondary_location" {
    type = string
    default = "West US"
    description = "secondary region for geo replication"
}

variable "sku"{
    type = string
    default = "Premium"
    validation {
      condition = (var.sku == "Basic" || var.sku == "Standard" || var.sku == "Premium")
      error_message = "Expected one of 'Basic', 'Standard' or 'Premium'"
    }
    description = "the container registry sku: 'Basic', 'Standard' or 'Premium'"
}

variable "name" {
    type = string
    default = "agents"  
}