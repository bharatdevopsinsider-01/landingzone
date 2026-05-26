
resource "azurerm_resource_group" "rgs" {

  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
}


resource "azurerm_storage_account" "Storage_account" {

  depends_on               = [azurerm_resource_group.rgs]
  for_each                 = var.storage
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}
