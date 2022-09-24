provider "vault" {
  address   = "https://vault-cluster.vault.55ff1c17-5f2b-42aa-b7a3-78c6a1ac9b80.aws.hashicorp.cloud:8200"
  namespace = var.namespace
  token     = var.vault_token
}

data "vault_azure_access_credentials" "get_creds" {
  role                        = "${var.subscription_id}_contributor"
  validate_creds              = var.validate_creds
  num_sequential_successes    = var.num_sequential_successes
  num_seconds_between_tests   = var.num_seconds_between_tests
  max_cred_validation_seconds = 300
  backend                     = "azure"
  tenant_id                   = var.tenant_id
  subscription_id             = var.subscription_id
}