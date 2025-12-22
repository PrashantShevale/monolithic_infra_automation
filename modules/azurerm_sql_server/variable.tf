variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    kv_name                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    connection_policy                            = optional(string)
    express_vulnerability_assessment_enabled     = optional(bool)
    transparent_data_encryption_key_vault_key_id = optional(string)
    minimum_tls_version                          = optional(string)
    public_network_access_enabled                = optional(bool)
    outbound_network_restriction_enabled         = optional(bool)
    primary_user_assigned_identity_id            = optional(string)

    identity = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })), [])
    tags = optional(map(string))
  }))

}



