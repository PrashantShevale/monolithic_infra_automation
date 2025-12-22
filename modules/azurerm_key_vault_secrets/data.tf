data "azurerm_key_vault" "kv" {
  for_each            = var.kv_secrets
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
