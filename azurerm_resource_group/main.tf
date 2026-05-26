
resource "azurerm_resource_group" "Rgs" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location

}
