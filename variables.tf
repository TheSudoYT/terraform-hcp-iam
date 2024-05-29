variable "groups" {
  description = "A map of groups with display_name and description"
  type = map(object({
    display_name = string
    description  = string
    project_id   = string
    role         = string
  }))
}

variable "users_to_groups_yaml_path" {
  description = "YAML content mapping user emails to group names"
  type        = string
}


variable "organization_id" {
  description = "HCP Organization ID"
  type        = string
}