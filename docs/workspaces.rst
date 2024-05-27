Terraform workspaces
====================

Workspaces allow you to manage multiple instances of the same set of
resources in a single configuration.

This document demonstrates creating a Workspace for the deletion of
Artifact Registry repositories.

1. Create a Workspace for Deletion of Artifact Registry repositories
--------------------------------------------------------------------

To create a new Terraform workspace, you can use the following commands:

1. Create a New Workspace:

   .. code:: shell

      terraform workspace new delete-artifact-registry-repos

2. Select the New Workspace:

   Switch to the newly created workspace using the following command:

   .. code:: shell

      terraform workspace select delete-artifact-registry-repos

By running these commands, you will create a new Terraform workspace
specifically for an Artifact Registry repositories deletion plan and
then switch to that workspace to perform the deletion operations. This
allows you to manage the deletion of specific Artifact Registry
repositories separately from other Terraform operations.

To show the current workspace, run:

.. code:: shell

   terraform workspace show

2. Modify existing configuration(s)
-----------------------------------

In your Terraform configuration, use the ``terraform.workspace``
variable to conditionally apply the resource deletion. For example:

.. code:: hcl

   resource "google_artifact_registry_repository" "example-artifact-registry-repository" {
      provider = google-beta

      // Evaluation of 0 leads to deletion of any instances of this resource that Terraform is managing.
      count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

      location      = var.region
      repository_id = "react-labs-test"
      description   = "Artifact Repository for testing React apps"
      format        = "DOCKER"

      labels = {
         environment = "sandbox"
      }
   }

With this setup:

-  In the ``delete-artifact-registry-repos`` workspace, ``count``
   evaluates to ``0``, leading to the deletion of any instances of this
   resource that Terraform is managing.
-  In any other workspace (e.g., ``default``), ``count`` evaluates to
   ``1``, so **1** instance of the specified resource will be created
   and managed by Terraform.

Ensure that your use of workspaces and the ``count`` attribute aligns
with your infrastructure management strategy, keeping in mind how
Terraform interprets ``count`` for resource creation and deletion.

--------------

Switching back to the default workspace
---------------------------------------

To switch back to the default workspace, you can use the following
command:

.. code:: shell

   terraform workspace select default

This command will switch the Terraform context back to the ``default``
workspace, allowing you to continue working with the resources in the
``default`` workspace.

--------------

Workspaces used in this project
-------------------------------

+--------------------------------------+-------------------------------------+
| Name                                 | Description                         |
+======================================+=====================================+
| ``default``                          | Provision all defined resources.    |
+--------------------------------------+-------------------------------------+
| ``delete-artifact-registry-repos``   | Delete Artifact Registry            |
|                                      | repositories.                       |
+--------------------------------------+-------------------------------------+
