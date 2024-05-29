# terraform-hcp-iam

HashiCorp Cloud Platform IAM Terraform Module

# Permissions

Ensure the service prinicipal has the `role/Admin` permissions at the organization level to add users to groups.

# Group Names in the YAML File

Ensure that the group names in the `.yaml` file provided by the input `users_to_groups_yaml_path` are formatted to match the last part of the resource name once the group is created in HCP.

Group resource names in HCP are created from the `display_name` of a group and spaces are replaced with `-` hyphens in the process. Example: `display_name = Vault Reader` means the group resource name in HCP will be `iam/organization/<org_id>/group/Vault-Reader`. So put `Vault-Reader` in the `.yaml` file.

