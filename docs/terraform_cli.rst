Terraform CLI
=============

Basic Commands
~~~~~~~~~~~~~~

-  **terraform init**: Initialize a Terraform working directory.
-  **terraform plan**: Generate and show an execution plan.
-  **terraform apply**: Build or change infrastructure.
-  **terraform destroy**: Destroy Terraform-managed infrastructure.
-  **terraform fmt**: Reformat your configuration in the standard style.
-  **terraform refresh**: Reformat your configuration in the standard
   style.
-  **terraform validate**: Check whether the configuration is valid.
-  **terraform show**: Inspect Terraform state or plan.
-  **terraform output**: Read an output from a state file.
-  **terraform version**: Show the current Terraform version.
-  **terraform workspace**: Manage workspaces.

Initialization
~~~~~~~~~~~~~~

-  **terraform init**: Initialize the configuration directory.

   .. code:: shell

      terraform init

   -  **terraform init -upgrade**: Upgrade all modules and plugins to
      the latest version.

      .. code:: shell

         terraform init -upgrade

Backend Configuration
~~~~~~~~~~~~~~~~~~~~~

-  **terraform init -backend-config=“path=backend.tf”**: Initialize with
   custom backend configuration.

   .. code:: shell

      terraform init -backend-config="path=backend.tf

Planning
~~~~~~~~

-  **terraform plan**: Generate and show an execution plan.

   .. code:: shell

      terraform plan

   -  **terraform plan -out=plan.tfplan**: Save the generated execution
      plan to a file.

      .. code:: shell

         terraform plan -out=plan.tfplan

   -  **terraform plan -refresh-only**: Refresh the state file without
      modifying the infrastructure.

      .. code:: shell

         terraform plan -refresh-only

   -  **terraform plan -detailed-exitcode**: Return detailed exit codes
      (0: no changes, 1: error, 2: changes present).

      .. code:: shell

         terraform plan -detailed-exitcode

Applying Changes
~~~~~~~~~~~~~~~~

-  **terraform apply**: Apply the changes required to reach the desired
   state.

   .. code:: shell

      terraform apply

   -  **terraform apply plan.tfplan**: Apply changes based on the saved
      plan file.

      .. code:: shell

         terraform apply plan.tfplan

   -  **terraform apply -auto-approve**: Apply changes without prompting
      for confirmation.

      .. code:: shell

         terraform apply -auto-approve

   -  **terraform apply -lock-timeout=5m**: Override the default state
      locking timeout.

      .. code:: shell

         terraform apply -lock-timeout=5m

Destroying Resources
~~~~~~~~~~~~~~~~~~~~

-  **terraform destroy**: Destroy the Terraform-managed infrastructure.

   .. code:: shell

      terraform destroy

   -  **terraform destroy -auto-approve**: Destroy infrastructure
      without prompting for confirmation.

      .. code:: shell

         terraform destroy -auto-approve

Formatting Code
~~~~~~~~~~~~~~~

-  **terraform fmt**: Reformat your configuration files.

   .. code:: shell

      terraform fmt

Validating Configuration
~~~~~~~~~~~~~~~~~~~~~~~~

-  **terraform validate**: Validate the configuration files.

   .. code:: shell

      terraform validate

Outputs
~~~~~~~

-  **terraform output**: Extract output variables from the state file.

   .. code:: shell

      terraform output

State Management
~~~~~~~~~~~~~~~~

-  **terraform show**: Show the current state or a saved plan.

   .. code:: shell

      terraform show

-  **terraform state list**: List resources in the state.

   .. code:: shell

      terraform state list

-  **terraform state show**: Show details of a specific resource.

   .. code:: shell

      terraform state show <RESOURCE>

-  **terraform state mv**: Move an item in the state.

   .. code:: shell

      terraform state mv <SOURCE> <DESTINATION>

-  **terraform state rm**: Remove an item from the state file.

   .. code:: shell

      terraform state rm <RESOURCE>

-  **terraform import**: Import existing infrastructure into your
   Terraform state.

   .. code:: shell

      terraform import <RESOURCE> <ID>

Workspaces
~~~~~~~~~~

-  **terraform workspace list**: List all workspaces.

   .. code:: shell

      terraform workspace list

-  **terraform workspace new**: Create a new workspace.

   .. code:: shell

      terraform workspace new <NAME>

-  **terraform workspace select**: Select an existing workspace.

   .. code:: shell

      terraform workspace select <NAME>

-  **terraform workspace show**: Show the current workspace.

   .. code:: shell

      terraform workspace show

-  **terraform workspace delete**: Delete a workspace.

   .. code:: shell

      terraform workspace delete <NAME>

Modules
~~~~~~~

-  **terraform get**: Download and update modules.

   .. code:: shell

      terraform get

-  **terraform module list**: List modules.

   .. code:: shell

      terraform module list

Providers
~~~~~~~~~

-  **terraform providers**: Show the providers required for the
   configuration.

   .. code:: shell

      terraform providers

   -  **terraform providers lock**: Generate a .terraform.lock.hcl file.

      .. code:: shell

         terraform providers lock

Environment Variables
~~~~~~~~~~~~~~~~~~~~~

-  **terraform env list**: List all available environments.

   .. code:: shell

      terraform env list

-  **terraform env select**: Switch to another environment.

   .. code:: shell

      terraform env select <NAME>

-  **terraform apply -var=‘key=value’**: Set a variable value directly
   from the command line.

   .. code:: shell

      terraform apply -var='key=value'

-  **terraform apply -var-file=“variables.tfvars”**

   .. code:: shell

      terraform apply -var-file="variables.tfvars"

-  **TF_VAR_name**: Set a variable.

   .. code:: shell

      export TF_VAR_name=value

-  **TF_CLI_ARGS**: Set default command-line options.

   .. code:: shell

      export TF_CLI_ARGS="-input=false"

Remote State
~~~~~~~~~~~~

-  **terraform remote config**: Configure remote state storage.

   .. code:: shell

      terraform remote config

-  **terraform remote pull**: Pull the remote state file.

   .. code:: shell

      terraform remote pull

-  **terraform remote push**: Push the local state file to the remote.

   .. code:: shell

      terraform remote push

Resource Targeting
~~~~~~~~~~~~~~~~~~

-  **terraform plan -target=**: Plan changes to a specific resource.

   .. code:: shell

      terraform plan -target=aws_instance.example

-  **terraform apply -target=**: Apply changes to a specific resource.

   .. code:: shell

      terraform apply -target=aws_instance.example

Debugging and Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  **terraform console**: An interactive console for evaluating
   expressions.

   .. code:: shell

      terraform console

-  **terraform force-unlock**: Manually unlock the state file if a
   manual unlock is required.

   .. code:: shell

      terraform force-unlock <LOCK_ID>

-  **TF_LOG**: Set logging level (TRACE, DEBUG, INFO, WARN, ERROR).

   .. code:: shell

      export TF_LOG=DEBUG

-  **TF_LOG_PATH**: Specify the path for log output.

   .. code:: shell

      export TF_LOG_PATH=./terraform.log

Miscellaneous
~~~~~~~~~~~~~

-  **terraform graph**: Generate a visual representation of the
   configuration.

   .. code:: shell

      terraform graph

-  **terraform taint**: Mark a resource for recreation.

   .. code:: shell

      terraform taint <RESOURCE>

-  **terraform untaint**: Remove the ‘tainted’ state from a resource.

   .. code:: shell

      terraform untaint <RESOURCE>

This document covers the most commonly used Terraform CLI commands and
options for efficient infrastructure management.
