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
      tenant_id               = string
      application_id          = string
      key_permissions         = list(string)
      secret_permissions      = list(string)
      certificate_permissions = list(string)
      storage_permissions     = list(string)
    }))
  }))
}
