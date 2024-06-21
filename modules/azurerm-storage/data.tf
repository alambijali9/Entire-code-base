data "azurerm_resource_group" "rg" {
  name = "technical-rg"

}

data "azurerm_location" "loc" {
  location = "centralindia"
}