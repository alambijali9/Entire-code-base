
resource "azurerm_virtual_network" "vnet-1" {
  name                = "peternetwork1"
  resource_group_name = "technical-rg"
  address_space       = ["192.168.1.0/24"]
  location            = "centralindia"
}

resource "azurerm_virtual_network" "vnet2-2" {
  name                = "peternetwork2"
  resource_group_name = "technical-rg"
  address_space       = ["10.0.1.0/24"]
  location            = "centralindia"
}

resource "azurerm_virtual_network_peering" "peer-1" {
  name                      = "peer1to2"
  resource_group_name       =  "technical-rg"
  virtual_network_name      = "peternetwork1"
  remote_virtual_network_id = azurerm_virtual_network.peer-2.id
}

resource "azurerm_virtual_network_peering" "peer-2" {
  name                      = "peer2to1"
  resource_group_name       =  "technical-rg"
  virtual_network_name      = "peternetwork2"
  remote_virtual_network_id = azurerm_virtual_network.peer-1.id
}