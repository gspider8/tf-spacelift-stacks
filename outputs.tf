output "stacks" {
  value = { for k, v in spacelift_stack.this : k => v }
}
