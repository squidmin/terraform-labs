Setup Pt. 2
===========

To make your Terraform project more manageable, especially as it grows,
using variables, outputs, and a remote backend for state management is
crucial. Below is a step-by-step guide to setting up these components
and defining a resource to grant Cloud Run invoker permissions to a GCP
service account.

Setting up ``variables.tf``
---------------------------

The ``variables.tf`` file is where you define variables that you can use
across your Terraform configuration. Variables make your configuration
more dynamic and reusable.

1. **Create ``variables.tf``**: In your project directory, create a file
   named ``variables.tf``.

2. **Define Variables**: Inside ``variables.tf``, you can define
   variables like the project ID, region, and any other parameters you
   want to be able to change easily. Here’s an example:

   .. code:: hcl

      variable "project_id" {
        description = "The ID of the project in which resources will be provisioned."
        type        = string
      }

      variable "region" {
        description = "The GCP region where resources will be provisioned."
        type        = string
      }

      variable "service_account_email" {
        description = "The email of the service account to grant Cloud Run invoker permissions."
        type        = string
      }

Setting up ``outputs.tf``
-------------------------

The ``outputs.tf`` file is used to define outputs from your Terraform
configuration. Outputs can be useful for retrieving the values of
certain resources once they are created.

1. **Create ``outputs.tf``**: In your project directory, create a file
   named ``outputs.tf``.

2. **Define Outputs**: For example, to output the ID of your project and
   the region, add the following:

   .. code:: hcl

      output "project_id" {
        value = var.project_id
      }

      output "region" {
        value = var.region
      }

Setting Up a Remote Backend in GCP for Terraform State
------------------------------------------------------

Terraform can store its state file remotely, which is particularly
useful for team environments or when managing state securely and
reliably. For GCP, you can use a Cloud Storage bucket as a backend.

1. **Create a Cloud Storage Bucket**:

   -  Use the Google Cloud Console or ``gsutil`` to create a new bucket.
      Bucket names must be globally unique.
   -  Example using ``gsutil``: ``gsutil mb gs://<YOUR_BUCKET_NAME>/``

2. **Configure Terraform to Use the Cloud Storage Backend**:

   -  In your Terraform configuration (e.g., in ``main.tf``), add a
      backend configuration block:

      .. code:: hcl

         terraform {
           backend "gcs" {
             bucket = "<YOUR_BUCKET_NAME>"
             prefix = "terraform/state"
           }
         }

   -  Replace ``<YOUR_BUCKET_NAME>`` with the name of your bucket.

3. **Initialize Terraform Again**: Run ``terraform init``. Terraform
   will ask if you want to copy your local state to the new backend.
   Confirm to proceed.

Defining a Resource for Cloud Run Invoker Permissions
-----------------------------------------------------

To grant Cloud Run invoker permissions to a service account, you can use
the ``google_cloud_run_service_iam_member`` resource.

1. Add to ``main.tf``:

   .. code:: hcl

      resource "google_cloud_run_service_iam_member" "invoker" {
        location = var.region
        project  = var.project_id
        service  = "<YOUR_CLOUD_RUN_SERVICE_NAME>"
        role     = "roles/run.invoker"
        member   = "serviceAccount:${var.service_account_email}"
      }

   -  Replace ``<YOUR_CLOUD_RUN_SERVICE_NAME>`` with the name of your
      Cloud Run service.
   -  This configuration assumes you have a variable
      ``service_account_email`` defined in your ``variables.tf``.

By following the above steps, you’ll enhance your Terraform
configuration with variables and outputs, securely manage your Terraform
state in a remote backend, and define a resource for granting Cloud Run
invoker permissions. Make sure to adjust the resource definitions and
variable values according to your specific requirements.
