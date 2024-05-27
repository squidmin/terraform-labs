Setup Pt. 1
===========

1. Install Necessary Software
-----------------------------

1. **Install Terraform**: Download and install Terraform from
   `terraform.io <https://www.terraform.io/>`__. Ensure it’s correctly
   installed by running ``terraform -v`` in your terminal, which should
   display the Terraform version.
2. **Install Google Cloud SDK**: Download and install the Google Cloud
   SDK from
   `cloud.google.com/sdk <https://cloud.google.com/sdk?hl=en>`__. This
   will include the ``gcloud`` command-line tool, which is essential for
   managing GCP resources.
3. **Configure ``gcloud``**: Once installed, initialize the ``gcloud``
   tool by running ``gcloud init`` in your terminal. Follow the prompts
   to authenticate and select your GCP project.

2. Set Up Google Cloud Project and Permissions
----------------------------------------------

1. **Enable APIs**: Ensure that the necessary APIs are enabled for your
   project. This typically includes the Compute Engine API, Cloud
   Storage API, and any other services you plan to use. You can enable
   these through the GCP Console or via the ``gcloud`` CLI.
2. **Create a Service Account**: Create a service account in your GCP
   project that Terraform will use to provision resources. Assign it the
   necessary roles (e.g., Owner or Editor) for the resources you plan to
   manage.
3. **Generate a Service Account Key**: Generate a JSON key file for your
   service account. This file will be used by Terraform to authenticate
   to GCP.

3. Initialize your Terraform Project
------------------------------------

1. **Create a Terraform Configuration File**: In your project directory,
   create a file named ``main.tf``. This file will contain your
   Terraform configuration.
2. **Configure the GCP Provider**:

   -  Open ``main.tf`` and add the Terraform configuration for the GCP
      provider, specifying the project ID and the path to the service
      account key JSON file you generated earlier.

      .. code:: hcl

         terraform {
           required_providers {
             google = {
               source = "hashicorp/google"
               version = "~> 3.5"
             }
           }
         }

         provider "google" {
           credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY_JSON>")
           project = "<YOUR_PROJECT_ID>"
           region = "us-central1"  // Change to your preferred region
         }

3. **Define Resources**: Define the GCP resources you want to provision
   in your ``main.tf``. This could include compute resources, storage
   buckets, networking components, etc.
4. **Create Other Terraform Files**:

   -  ``variables.tf``: Define any variables you want to use in your
      configuration.
   -  ``outputs.tf``: Specify outputs that Terraform will report after
      it applies your configurations.
   -  ``terraform.tfvars`` (optional): Define values for your declared
      variables.

4. Initialize Terraform
-----------------------

Run ``terraform init`` in your terminal path within the project
directory. This command initializes the Terraform project, downloads the
GCP provider, and prepares Terraform to manage your infrastructure.

5. Plan and Apply Your Configuration
------------------------------------

1. **Terraform Plan**: Execute ``terraform plan`` in your project
   directory. This command shows you what actions Terraform will perform
   without actually making any changes. It’s a good practice to review
   this output to ensure that your configuration does what you expect.

2. **Terraform Apply**: If you’re satisfied with the plan, run
   ``terraform apply``. Terraform will ask for confirmation before
   proceeding. Upon confirmation, Terraform will provision the resources
   defined in your ``main.tf`` file in your GCP project.

      When running ``terraform apply``, it’s a good practice to save the
      plan to a file using the ``-out`` option. This allows you to
      review the plan before applying the changes and ensures that the
      same plan is executed when you later apply the changes.

      Before applying the changes, run:

      ::

         terraform plan -out=tfplan

      then use

      ::

         terraform apply tfplan

      to apply the changes using the saved plan.

      It’s a best practice to save the plan before applying changes to
      your infrastructure.

Additional Tips
---------------

-  **Version Control**: Consider using a version control system like Git
   to manage your Terraform configurations. It’s a best practice to
   version control your infrastructure as code.
-  **Terraform State**: Terraform tracks the state of your managed
   resources in a file called ``terraform.tfstate``. It’s important to
   manage this file carefully, especially if you’re working in a team.
   Consider using Terraform Cloud or a remote backend in GCP to store
   your state file.
-  **Security Practices**: Keep your service account key file secure and
   never commit it to version control. Use environment variables or
   encrypted secrets management solutions for handling sensitive
   information.
-  **Modularize Your Configuration**: As your infrastructure grows,
   consider breaking down your Terraform configuration into mofules.
   Modules allow you to reuse and manage common sets of resources more
   efficiently.

By following these steps, you’ll have set up a basic Terraform
configuration for provisioning resources in your GCP project. From here,
you can continue to expand and refine your infrastructure as needed.
Terraform’s documentation and the Terraform Registry are great resources
for learning more about available providers, resources, and modules to
use in your projects.
