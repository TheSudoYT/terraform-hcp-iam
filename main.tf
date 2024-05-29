locals {
  users_to_groups_yaml = file(var.users_to_groups_yaml_path)
  users_to_groups      = yamldecode(local.users_to_groups_yaml)
  user_email_list = flatten([
    for group_name, group_data in local.users_to_groups : [
      for email in group_data.users : {
        group = group_name
        email = email
      }
    ]
  ])
}

# Data source to look up user IDs based on email addresses
data "hcp_user_principal" "users" {
  for_each = { for user in local.user_email_list : user.email => user... }

  email = each.value[0].email
}


resource "hcp_group" "group" {
  for_each = var.groups

  display_name = each.value.display_name
  description  = each.value.description
}

resource "hcp_group_members" "group_members" {
  for_each = local.users_to_groups

  # Must be in format iam/organization/<organization_id>/group/<name>
  group = "iam/organization/${var.organization_id}/group/${each.key}"

  members = [
    for email in each.value.users : data.hcp_user_principal.users[email].user_id
  ]
}

resource "hcp_project_iam_binding" "project_binding" {
  for_each = var.groups

  project_id   = each.value.project_id
  principal_id = hcp_group.group[each.key].resource_id
  role         = each.value.role
}