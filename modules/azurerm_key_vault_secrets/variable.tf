variable "kv_secrets" {
  type = map(object({
    secret_name             = string
    secret_value            = string
    kv_name                 = string
    resource_group_name     = string
    content_type            = optional(string)
    not_before_date         = optional(string)
    expiration_date         = optional(string)
    tags                    = map(string)
  }))
}
