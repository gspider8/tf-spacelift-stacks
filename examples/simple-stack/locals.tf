variable "spacelift_local_test" {
  description = "Set to true when you want to use run this stack locally."
  default     = false
}

data "spacelift_current_space" "this" {
  count = var.spacelift_local_test ? 0 : 1
}

locals {
  space_id = var.spacelift_local_test ?
    "root" : data.spacelift_current_space.this.id
}