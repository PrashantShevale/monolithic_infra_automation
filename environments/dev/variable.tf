variable "rg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}


variable "vnets" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    address_space           = list(string)
    dns_servers             = optional(list(string))
    bgp_community           = optional(string)
    edge_zone               = optional(string)
    flow_timeout_in_minutes = optional(number)
    tags                    = map(string)

    ddos_protection_plan = optional(list(object({
      id     = string
      enable = bool
    })), [])

    subnets = optional(list(object({
      name                                          = string
      address_prefix                                = list(string)
      service_endpoints                             = optional(list(string))
      private_endpoint_network_policies             = optional(bool)
      private_link_service_network_policies_enabled = optional(bool)
      delegation = optional(list(object({
        name = string
        service_delegation = object({
          name    = string
          actions = list(string)
        })
      })), [])
    })), [])
  }))
}

variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string
    tags                 = map(string)
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
      private_ip_address_version    = string
      primary                       = bool
    }))
  }))
}

variable "nsgs" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    tags                = map(string)

    security_rules = optional(list(object({
      name                         = string
      priority                     = number
      direction                    = string
      access                       = string
      protocol                     = string
      source_port_range            = optional(string)
      destination_port_range       = optional(string)
      source_address_prefix        = optional(string)
      destination_address_prefix   = optional(string)
      source_port_ranges           = optional(list(string))
      destination_port_ranges      = optional(list(string))
      source_address_prefixes      = optional(list(string))
      destination_address_prefixes = optional(list(string))
    })), [])
  }))
}

variable "nic_nsg_associations" {
  type = map(object({
    nic_name            = string
    nsg_name            = string
    resource_group_name = string
  }))

}



variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    sku                 = string
    allocation_method   = string
    tags                = map(string)
  }))
}

variable "kv" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    sku_name                        = string
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    purge_protection_enabled        = bool
    soft_delete_retention_days      = number
    tags                            = map(string)
    access_policy = list(object({
      tenant_id               = optional(string)
      application_id          = optional(string)
      key_permissions         = list(string)
      secret_permissions      = list(string)
      certificate_permissions = list(string)
      storage_permissions     = list(string)
    }))
  }))
}

variable "kv_secrets" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    kv_name             = string
    resource_group_name = string
    content_type        = optional(string)
    not_before_date     = optional(string)
    expiration_date     = optional(string)
    tags                = map(string)
  }))
}

variable "vms" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    vm_size                         = string
    disable_password_authentication = bool
    tags                            = map(string)
    nic_name                        = string
    kv_name                         = string
    vm_username_secret_name         = string
    vm_password_secret_name         = string
    provision_vm_agent              = bool

    admin_ssh_keys = list(object({
      username   = string
      public_key = string
    }))

    os_disk = list(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

  }))
}

variable "sql_servers" {
  type = map(object({
    name                                         = string
    resource_group_name                          = string
    location                                     = string
    version                                      = string
    kv_name                                      = string
    administrator_login                          = optional(string)
    administrator_login_password                 = optional(string)
    connection_policy                            = optional(string)
    express_vulnerability_assessment_enabled     = optional(bool)
    transparent_data_encryption_key_vault_key_id = optional(string)
    minimum_tls_version                          = optional(string)
    public_network_access_enabled                = optional(bool)
    outbound_network_restriction_enabled         = optional(bool)

    identity = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })), [])
    tags = map(string)
  }))

}

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
    tags                                                       = map(string)

  }))
}
