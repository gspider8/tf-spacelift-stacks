variable "stacks" {
  description = "A map of stack configurations"
  type = map(object({
    # General Attributes
    description = string
    labels      = optional(list(string), [])
    space_id    = optional(string, "root")

    # Configuration Attributes
    administrative = optional(bool, false)
    autodeploy     = optional(bool, false)
    autoretry      = optional(bool, false)

    # GitHub Attributes
    repo         = string
    branch       = string
    project_root = string

    # Terraform/OpenTofu Attributes
    tf_version            = optional(string, null)
    tf_workflow_tool      = optional(string, null) # Defaults to TERRAFORM_FOSS, also: OPEN_TOFU
    tf_smart_sanitization = optional(bool, true)

    # Ansible Attributes
    ansible_playbook = optional(set(string), [])

    # Kubernetes Attributes
    kubernetes_namespace = optional(set(string), [])

    # Spacelift Job Attributes
    runner_image   = optional(string, null)
    worker_pool_id = optional(string, null)
    before_init    = optional(list(string), [])
    before_plan    = optional(list(string), [])
    before_apply   = optional(list(string), [])
  }))
  default = {}
}

variable "contexts" {
  description = "A map of context configurations"
  type = map(object({
    description         = string
    before_init         = optional(list(string), [])
    before_plan         = optional(list(string), [])
    before_apply        = optional(list(string), [])
    space_id            = optional(string, "root")
    add_public_ssh_key  = optional(bool, "false")
    add_private_ssh_key = optional(bool, "false")
    labels              = optional(list(string), null)
  }))
  default = {}
}

variable "env_vars" {
  description = "A map of environment variable configurations"
  type = map(object({
    context_name   = optional(string, null)
    stack_name     = optional(string, null)
    add_to_context = optional(bool, true)
    name           = string
    value          = string
    is_secret      = optional(bool, false)
  }))
  default = {}
}

variable "mounted_files" {
  description = "A map of mounted files that will be added to a context"
  type = map(object({
    context_name  = string
    relative_path = string
    content       = string
  }))
  default = {}
}

variable "context_attachments" {
  description = "A map of context attachment configurations"
  type = map(object({
    context_name = string
    stack_name   = string
    priority     = optional(number, 0)
  }))
  default = {}
}

variable "stack_dependencies" {
  description = "Creates dependencies between stacks"
  type = map(object({
    stack_child  = string
    stack_parent = string
  }))
  default = {}
}

variable "dependency_variables" {
  description = "Shares variables between parent and child stacks"
  type = map(object({
    dependency_name = string
    output_name     = string
    input_name      = string
  }))
  default = {}
}