# Description
This module will call the HashiConf Org Vault and retrieve temporary Azure credentials to be used for authenticating to Azure to deploy terraform.
The credentials returned will have CONTRIBUTOR access at the subscription level, based on the subscription_id passed to the module.

# Resources
No visible resources will be created in Azure.
A temporary SPN will be created in Azure Active Directory with a name that starts with `vault-<guid>`.  The temporary SPN will automatically be removed by Hashi Vault when TTL is reached. 

# Example Usage
```
module "vaultprovider" {
  source  = "app.terraform.io/weyerhaeuser/vaultprovider/azurerm"
  version = "~>1.0"
  vault_token = var.vault_token
  subscription_id = var.subscription_id
}
```

# Inputs
`vault_token` - [sensitive] (required) The vault token will be configured on the workspace by the ADO pipelines, this should not be updated or changed.  

`subscription_id` - (required) The subscription_id will be configured on the workspace by the ADO pipelines, this should not be updated or changed. 

`tenant_id` - (optional) default to the WY tenant_id. The tenant_id will be configured on the workspace by the ADO pipelines, this should not be updated or changed.

`validate_creds` - (optional) default `true` - This will validate the temporary creds passed back from vault before using them to auth into the Azure provider.

`num_sequential_successes` - (optional) defaults to 8 - How many sequential successful validation attempts to occur before returning the credentials to the Azure provider. Only applies if `validate_creds` is set to `true`.

`num_seconds_between_tests` - (optional) defaults to 1 - How many seconds between validation attempts.  Only applies if `validate_creds` is set to `true`.

`namespace` - (optional) - defaults to `admin\cloud`

# Outputs
`client_id` - [sensitive] this is the client id to be used to auth to AzureRM provider.
`client_secret` - [sensitive] this is the client secrets to be used to auth to AzureRM provider.
