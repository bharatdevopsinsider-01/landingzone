
resource "azurerm_resource_group" "Rgs" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnet" {

  for_each            = var.vnet
  depends_on          = [azurerm_resource_group.Rgs]
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {

  depends_on           = [azurerm_virtual_network.vnet]
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes

}
