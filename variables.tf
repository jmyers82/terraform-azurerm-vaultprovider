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
  default = "a7499e28-6a7f-48d9-8b14-d3e690989660"
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