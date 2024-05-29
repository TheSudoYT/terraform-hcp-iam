# terraform-hcp-iam

HashiCorp Cloud Platform IAM Terraform Module

# Permissions

Ensure the service prinicipal has the `role/Admin` permissions at the organization level to add users to groups.

# Group and User Mapping

The input `users_to_groups_yaml_path` is required and must be a yaml formatted file. The file must contain a map of groups to users like so:

```yaml
Vault-Admin:
  users:
    - user1@example.com
Vault-Writer:
  users:
    - user1@example.com
Vault-Reader:
  users:
    - user1@example.com
    - user2@example.com
```

# Group Names in the YAML File

Ensure that the group names in the `.yaml` file provided by the input `users_to_groups_yaml_path` are formatted to match the last part of the resource name once the group is created in HCP.

Group resource names in HCP are created from the `display_name` of a group and spaces are replaced with `-` hyphens in the process. Example: `display_name = Vault Reader` means the group resource name in HCP will be `iam/organization/<org_id>/group/Vault-Reader`. So put `Vault-Reader` in the `.yaml` file.

## Providers

| Name | Version |
|------|---------|
| hcp | n/a |

## Resources

| Name | Type |
|------|------|
| [hcp_group.group](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/group) | resource |
| [hcp_group_members.group_members](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/group_members) | resource |
| [hcp_project_iam_binding.project_binding](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/project_iam_binding) | resource |
| [hcp_user_principal.users](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/user_principal) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| groups | A map of groups to create in HCP IAM. Each group should have a display\_name, description, project\_id, and role. | <pre>map(object({<br>    display_name = string<br>    description  = string<br>    project_id   = string<br>    role         = string<br>  }))</pre> | n/a | yes |
| organization\_id | HCP Organization ID | `string` | n/a | yes |
| users\_to\_groups\_yaml\_path | Path to YAML file with mapping of user emails to group names | `string` | n/a | yes |

