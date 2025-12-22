variable "sql_databases" {
  type = map(object({
    name                                                       = string
    resource_group_name                                        = string
    server_name                                                = string
    sku_name                                                   = optional(string)
    collation                                                  = optional(string)
    max_size_gb                                                = optional(number)
    min_capacity                                               = optional(number)
    zone_redundant                                             = optional(bool)
    license_type                                               = optional(string)
    read_replica_count                                         = optional(number)
    geo_backup_enabled                                         = optional(bool)
    transparent_data_encryption_enabled                        = optional(bool)
    transparent_data_encryption_key_vault_key_id               = optional(string)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool)
    ledger_enabled                                             = optional(bool)
    read_scale                                                 = optional(bool)
    sample_name                                                = optional(string)
    storage_account_type                                       = optional(string)
    enclave_type                                               = optional(string)
    maintenance_configuration_name                             = optional(string)
    secondary_type                                             = optional(string)
    creation_source_database_id                                = optional(string)
    create_mode                                                = optional(string)
    restore_point_in_time                                      = optional(string)
    recover_database_id                                        = optional(string)
    recovery_point_id                                          = optional(string)
    restore_dropped_database_id                                = optional(string)
    restore_long_term_retention_backup_id                      = optional(string)
    elastic_pool_id                                            = optional(string)
    auto_pause_delay_in_minutes                                = optional(number)
    tags                                                       = optional(map(string))
    # import = optional(list(object({
    #   storage_uri                  = string
    #   storage_key                  = string
    #   storage_key_type             = string
    #   administrator_login          = string
    #   administrator_login_password = string
    #   authentication_type          = string
    #   storage_account_id           = string
    # })))
    # threat_detection_policy = optional(list(object({
    #   state                      = string
    #   disabled_alerts            = optional(list(string))
    #   email_account_admins       = optional(bool)
    #   email_addresses            = optional(list(string))
    #   retention_days             = optional(number)
    #   storage_account_access_key = optional(string)
    #   storage_endpoint           = optional(string)
    # })))
  }))
}
