resource "azurerm_mssql_server" "sql_servers" {
  for_each                                     = var.sql_servers
  name                                         = each.value.name
  resource_group_name                          = each.value.resource_group_name
  location                                     = each.value.location
  version                                      = each.value.version
  administrator_login                          = each.value.administrator_login
  administrator_login_password                 = each.value.administrator_login_password 
  connection_policy                            = each.value.connection_policy
  express_vulnerability_assessment_enabled     = each.value.express_vulnerability_assessment_enabled
  transparent_data_encryption_key_vault_key_id = each.value.transparent_data_encryption_key_vault_key_id
  minimum_tls_version                          = each.value.minimum_tls_version
  public_network_access_enabled                = each.value.public_network_access_enabled
  outbound_network_restriction_enabled         = each.value.outbound_network_restriction_enabled
  primary_user_assigned_identity_id            = each.value.primary_user_assigned_identity_id

  dynamic "identity" {
    for_each = each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  tags = each.value.tags
}
