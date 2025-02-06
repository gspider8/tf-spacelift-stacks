# Saturnhead Spacelift Stacks Module

### Module Input Variables
`stacks` - A map of stack configurations.
- `key` - Used to set the name of the stack.
- `description` - Required. Description of Stack.
- `repo` - Required. The VCS Repo that the stack will build from.
- `branch` - Required. The VCS Branch that this will create from.
- `project_root` - Required. VCS Directory to build from.
- `space_id` - Optional. Space that the stack will be created in. Default: "root"
- `administrative` - Boolean for administrative stacks. Default: false
- `autodeploy` - Boolean for unconfirmed applies on the stack. Default: false
- `autoretry` - Boolean for repeating apply on failures. Default: false
- `tf_smart_sanitization` - Indicates whether runs on this will use terraform's sensitive value system to 
  sanitize the outputs of Terraform state and plans in spacelift instead of sanitizing all fields. Default: false
- `tf_workflow_tool` - Options: `TERRAFORM_FOSS`, `OPEN_TOFU`
- `tf_version` - will "^1.9.0" work?
- `ansible_playbook`
- `labels` - array(string)
- `runner_image`, `worker_pool_id`
- `kubernetes_namespace`
- `before_init`, `before_plan`, `before_apply`

`contexts` - Context Configurations
- `key` - used as name of context 
- `description` - Required
- `space_id` - Default: "root"
- `labels` - use `autoattach:<label-name>` for attaching
- `add_private_ssh_key`, `add_public_ssh_key`
- `before_init`, `before_plan`, `before_apply`

`env_vars` - A map of environment variable configurations
- `key` - map for each env_var
- `add_to_context` - Add to context vs add to stack. Default: true
- `stack_name` - Optional. If wanting to add to stack
- `context_name` - Optional. Use if wanting to add to context.
- `name` - Var Name
- `value` - Var Value
- `is_secret` - Var value is secret. Default: false

`mounted_files` - A map of mounted files that will be added to a context. Can be used for ssh keys with specific 
  configurations.
  - `key` 
  - `context_name`
  - `relative_path`
  - `content`

`context_attachments`

`stack_dependencies` - Creates dependencies between stacks.
  - `key` - Used as dependency_name for dependency_variables
  - `stack_child`
  - `stack_parent`
`dependency_variables` - Shares variables between parent and child stacks
  - `key`
  - `dependency_name` - key used for stack_dependencies
  - `output_name` - name of output of stack1 to be linked
  - `input_name` - name of input of stack2 to be linked

`policies` - Only availiable in paid version of Spacelift

### Usage
- See Examples

### Outputs
-

### Authors
- gspider8

### References
- https://github.com/saturnhead/spacelift_ansible_examples/tree/main/modules/spacelift_stacks
