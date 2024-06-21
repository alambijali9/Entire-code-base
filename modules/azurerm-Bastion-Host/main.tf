resource "azurerm_public_ip" "pip" {
  name                = var.bastion.pip-name
  location            = var.bastion.location
  resource_group_name = var.bastion.resource_group_name
  allocation_method   = var.bastion.allocation_method
  sku                 = var.bastion.sku
}

resource "azurerm_bastion_host" "bastion" {
  name                =  var.bastion.bastion-name
  location            =  var.bastion.location
  resource_group_name =  var.bastion.resource_group_name

  ip_configuration {
    name                 = "ipconfig"
    subnet_id            = data.azurerm_subnet.bastion-sub-data.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
