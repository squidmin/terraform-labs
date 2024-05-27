Should developers commit ``tfplan`` files to version control?
=============================================================

The decision to commit ``tfplan`` files to version control is a matter
of best practices and depends on the specific requirements of your
workflow. Here are some considerations based on the discussions and
resources:

1. **Remote State Storage**: The primary recommendation is to use a
   remote backend for storing the Terraform state, such as S3 or Google
   Cloud Storage. This approach is preferred over storing the state file
   in version control, as it provides better collaboration and avoids
   potential issues with concurrent state modifications.

2. **Sensitive Data**: The Terraform state can contain sensitive
   information, such as initial passwords for resources like AWS RDS.
   Storing this sensitive data in version control may pose security
   risks.

3. **Plan Files**: The general consensus is to not version the
   ``tfplan`` files. The ``tfplan`` file is a temporary file generated
   by ``terraform plan`` and is not intended to be stored in version
   control. The focus should be on versioning the ``.tf`` configuration
   files and managing the Terraform state in a remote backend with
   appropriate access controls.

Based on these considerations, it’s recommended to exclude the
``tfplan`` files from version control by adding them to the
``.gitignore`` file. Additionally, it’s important to ensure that
sensitive data and the Terraform state are managed securely, such as
using remote state backends with versioning enabled.

Here’s a sample ``.gitignore`` entry for excluding ``tfplan`` files:

::

   # Ignore tfplan files
   *.tfplan

By following these best practices, you can maintain a more secure and
collaborative Terraform workflow while ensuring that sensitive
information and temporary plan files are appropriately handled[1][2].

Citations: [1]
https://stackoverflow.com/questions/38486335/should-i-commit-tfstate-files-to-git
[2] https://github.com/hashicorp/terraform/issues/13891 [3]
https://github.com/hashicorp/learn-terraform-provider-versioning/blob/main/.gitignore
[4]
https://www.reddit.com/r/Terraform/comments/atgssq/plan_under_version_control/?rdt=37594
[5]
https://www.reddit.com/r/Terraform/comments/yxtq02/items_to_include_in_gitignore_when_using_a_cli/
