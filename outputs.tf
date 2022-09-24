output "client_id" {
  value = data.vault_azure_access_credentials.get_creds.client_id
  sensitive = true
}

output "client_secret" {
  value = data.vault_azure_access_credentials.get_creds.client_secret
  sensitive = true
}