variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string
    tags                 = optional(map(string))
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
      private_ip_address_version    = string
      primary                       = bool
    }))
  }))
}
