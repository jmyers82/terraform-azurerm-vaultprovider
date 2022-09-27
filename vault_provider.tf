provider "vault" {
  address   = "https://vault-cluster-public-vault-a02ab7e1.7dfb5d47.z1.hashicorp.cloud:8200"
  namespace = var.namespace
  # token     = var.vault_token
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }


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