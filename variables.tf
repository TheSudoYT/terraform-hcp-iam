variable "groups" {
  description = "A map of groups to create in HCP IAM. Each group should have a display_name, description, project_id, and role."
  type = map(object({
    display_name = string
    description  = string
    project_id   = string
    role         = string
  }))
}

variable "users_to_groups_yaml_path" {
  description = "Path to YAML file with mapping of user emails to group names"
  type        = string
}


variable "organization_id" {
  description = "HCP Organization ID"
  type        = string
}