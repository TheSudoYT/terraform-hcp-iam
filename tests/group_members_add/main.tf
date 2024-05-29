resource "hcp_group_members" "group_members" {
  # Must be in format iam/organization/<organization_id>/group/<name>
  group = "iam/organization/1234/group/Vault-Reader"

  members = [
    "1234",
  ]
}