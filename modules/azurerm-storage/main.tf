resource "azurerm_storage_account" "example" {
  name                     = "storageaccounttest"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 =data.azurerm_location.loc.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}