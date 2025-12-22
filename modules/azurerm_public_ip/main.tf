resource "azurerm_public_ip" "pip" {
  for_each            = var.pips
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  allocation_method   = each.value.allocation_method
  tags                = each.value.tags 
}
