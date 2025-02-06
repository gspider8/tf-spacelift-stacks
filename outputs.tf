output "stacks" {
  value = { for k, v in spacelift_stack.this : k => v }
}

output "contexts" {
  value = { for k, v in spacelift_context.this : k => v }
}

output "env_vars" {
  value = { for k, v in spacelift_environment_variable.this : k => v }
}
