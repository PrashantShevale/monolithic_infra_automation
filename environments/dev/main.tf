module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.rg
}

module "virtual_networks" {
  source     = "../../modules/azurerm_networking"
  vnets      = var.vnets
  depends_on = [module.resource_group]

}

module "network_interface_card" {
  source     = "../../modules/azurerm_nic"
  nic        = var.nic
  depends_on = [module.resource_group, module.virtual_networks]

}
module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.resource_group]

}

module "network_security_groups" {
  source     = "../../modules/azurerm_nsg"
  nsgs       = var.nsgs
  depends_on = [module.resource_group]

}

module "virtual_machines" {
  source     = "../../modules/azurerm_vm"
  vms        = var.vms
  depends_on = [module.network_interface_card, module.public_ip, module.key_vault, module.key_vault_secrets, module.virtual_networks, module.resource_group]

}

module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  kv         = var.kv
  depends_on = [module.resource_group]
}

module "key_vault_secrets" {
  source     = "../../modules/azurerm_key_vault_secrets"
  kv_secrets = var.kv_secrets
  depends_on = [module.key_vault]
}

module "sql_servers" {
  source      = "../../modules/azurerm_sql_server"
  sql_servers = var.sql_servers
  depends_on  = [module.resource_group]

}

module "sql_databases" {
  source        = "../../modules/azurerm_sql_database"
  sql_databases = var.sql_databases
  depends_on    = [module.sql_servers, module.resource_group]
}
