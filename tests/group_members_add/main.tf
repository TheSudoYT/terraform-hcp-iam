resource "hcp_group_members" "group_members" {
  # Must be in format iam/organization/<organization_id>/group/<name>
  group = "iam/organization/dae80db0-ad81-4b9d-ab63-1d76dd498d5e/group/Vault-Reader"

  members = [
    "f4326073-664b-47da-9796-55003dec2f40",
  ]
}