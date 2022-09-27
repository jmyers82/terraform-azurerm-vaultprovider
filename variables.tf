variable "namespace" {
  type = string
  default = "admin/cloud"
}

variable "vault_token" {
  type = string
  sensitive = true
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string  
  default = "46eb567a-7cf3-48cc-9a90-f6deab9bb040"
}

variable "num_sequential_successes" {
  type = number
  default = 8
}

variable "num_seconds_between_tests" {
  type = number
  default = 1
}

variable "validate_creds" {
  type = bool
  default = true
}

variable "login_approle_role_id" {}
variable "login_approle_secret_id" {}