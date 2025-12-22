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
