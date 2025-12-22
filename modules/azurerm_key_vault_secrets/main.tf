resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each         = var.kv_secrets
  name             = each.value.secret_name
  value            = each.value.secret_value
  key_vault_id     = data.azurerm_key_vault.kv[each.key].id
  content_type     = each.value.content_type
  not_before_date  = each.value.not_before_date
  expiration_date  = each.value.expiration_date
  tags             = each.value.tags
}
