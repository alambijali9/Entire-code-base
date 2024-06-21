data "azurerm_subnet" "bastion-sub-data" {
  name                 = var.bastion.subnet-name
  virtual_network_name = var.bastion.virtual_network_name
  resource_group_name  = var.bastion.resource_group_name
}
