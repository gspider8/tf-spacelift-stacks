terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

# Configuration for running Spacelift locally
variable "spacelift_endpoint" {
  type    = string
  default = ""
}
variable "spacelift_key_id" {
  type    = string
  default = ""
}
variable "spacelift_key_secret" {
  type    = string
  default = ""
}

provider "spacelift" {
  api_key_endpoint = var.spacelift_endpoint
  api_key_id       = var.spacelift_key_id
  api_key_secret   = var.spacelift_key_secret
}