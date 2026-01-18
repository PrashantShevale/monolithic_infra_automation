data "azurerm_network_security_group" "nsg-id" {
  for_each            = var.nic_nsg_associations
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic-id" {
  for_each            = var.nic_nsg_associations
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
