locals {
  vault_project_id         = "1234"
  vault_secrets_project_id = "1234"
}

module "iam" {
  source = "../../"

  organization_id           = "1234"
  users_to_groups_yaml_path = "users.yml"

  groups = {
    vault-admin = {
      display_name = "Vault Admin"
      description  = "Vault Admins Group"
      project_id   = local.vault_project_id
      role         = "roles/admin"
    }
    vault-writer = {
      display_name = "Vault Writer"
      description  = "Vault Writers Group"
      project_id   = local.vault_project_id
      role         = "roles/contributor"
    }
    vault-reader = {
      display_name = "Vault Reader"
      description  = "Vault Readers Group"
      project_id   = local.vault_project_id
      role         = "roles/viewer"
    }
    vault-secrets-admin = {
      display_name = "Vault Secrets Admin"
      description  = "Vault Secrets Admins Group"
      project_id   = local.vault_secrets_project_id
      role         = "roles/admin"
    }
    vault-secrets-writer = {
      display_name = "Vault Secrets Writer"
      description  = "Vault Secrets Writers Group"
      project_id   = local.vault_secrets_project_id
      role         = "roles/contributor"
    }
    vault-secrets-reader = {
      display_name = "Vault Secrets Reader"
      description  = "Vault Secrets Readers Group"
      project_id   = local.vault_secrets_project_id
      role         = "roles/viewer"
    }
    vault-secrets-salesforce-app-write = {
      display_name = "Vault Secrets Salesforce App Write"
      description  = "Can write to the Salesforce App in HCP Vault Secrets"
      project_id   = local.vault_secrets_project_id
      role         = "roles/secrets.app-manager"
    }
    vault-secrets-adp-app-read = {
      display_name = "Vault Secrets ADP App Read"
      description  = "Can read from the ADP App in HCP Vault Secrets"
      project_id   = local.vault_secrets_project_id
      role         = "roles/secrets.app-secret-reader"
    }
  }
}
