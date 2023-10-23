variable "name" {
  type        = string
  description = "the name of the image"
}

variable "container_registry_id" {
  type        = string
  description = "the container registry where this image will build"
}

variable "operating_system" {
  type        = string
  description = "the operating system. Valid values are 'linux' or 'windows'"
  default     = "linux"
  validation {
    condition     = (lower(var.operating_system) == "linux" || lower(var.operating_system) == "windows")
    error_message = "expected 'linux' or 'windows'"
  }
}

variable "git_repo_url" {
  type = string
}

variable "git_repo_access_token" {
  type      = string
  sensitive = true
}