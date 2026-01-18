resource "azurerm_network_interface_security_group_association" "nic-nsg-association" {
  for_each                  = var.nic_nsg_associations
  network_interface_id      = data.azurerm_network_interface.nic-id[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-id[each.key].id
}
