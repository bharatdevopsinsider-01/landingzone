resource "azurerm_resource_group" "Rg" {
  name     = "dev-rg"
  location = "centralindia"
}

resource "azurerm_virtual_network" "vnet" {

  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resouce_group_name
  address_space       = each.value.adress_space
}
