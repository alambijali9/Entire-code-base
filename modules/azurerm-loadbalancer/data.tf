
data "azurerm_virtual_network" "vnet-data" {
  name                =  var.lb.vnet_name
  resource_group_name =  var.lb.resource_group_name
}

data "azurerm_network_interface" "nic1-data" {
  name                =    var.lb.nic1_name   
  resource_group_name =var.lb.resource_group_name
}
data "azurerm_network_interface" "nic2-data" {
  name                =    var.lb.nic2_name  
  resource_group_name =var.lb.resource_group_name
}
