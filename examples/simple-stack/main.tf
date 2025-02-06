module "stacks" {
  source = "../.."
  stacks = {
    my-stack = { # name
      # General Characteristics
      description = "This stack is used to build... for..."
      labels      = ["my-stack", "my-env"] # Labels can be very powerful in combination with autoattach
      space_id    = local.space_id

      # VCS - Defaults to GitHub
      # For this example we will use a build included in this directory
      # In you use, change it to the repo that you would like to build.

      repo         = "tf-spacelift-stacks" # gspider8/tf-spacelift-stacks
      branch       = "main"
      project_root = "examples/simple-stack/stack-to-build"

      # Run Configuration
      administrative          = false
      terraform_workflow_tool = "OPEN_TOFU"
      terraform_version       = "^1.9.0"
    }
  }

  contexts = {
    my-context = {
      space_id    = local.space_id
      description = "Context with variables used by my stack."
      labels      = ["autoattach:my-stack"] # my-stack must be on your stack for them to attach.
    }
  }
  env_vars = {
    project_name = {
      name         = "TF_VAR_project_name"
      value        = "test-project"
      is_secret    = false
      context_name = "my-context"
    }
    region = {
      name         = "TF_VAR_region"
      value        = "us-east-1"
      is_secret    = false
      context_name = "my-context"
    }
    env = {
      name         = "TF_VAR_env"
      value        = "prod"
      is_secret    = false
      context_name = "my-context"
    }
  }
  mounted_files = {}

  stack_dependencies   = {}
  dependency_variables = {}
}
