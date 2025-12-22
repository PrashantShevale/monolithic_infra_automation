output "nic_ids" {
  value = { for k, v in azurerm_network_interface.nic : k => v.id }
}
output "pip_ids" {
  value = { for k, v in data.azurerm_public_ip.pip_ids : k => v.id }
}
