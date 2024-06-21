module "resource_group" {
  source = "../../modules/azurerm-Resource_Group"
 
}

module "virtual-network" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm-Virtual-network"
  vnet =var.vnet
}


module "Subnet" {
  depends_on = [ module.resource_group,module.virtual-network ]
  source = "../../modules/azurerm-Subnet"
sub=var.sub
  
}

module "virtual-machine" {
  depends_on = [ module.resource_group,module.Subnet ]
  source = "../../modules/azurerm-Virtual-machine"
vm=var.vm
  
}

module "storage" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm-storage"

}

module "keyvault" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm-Key-vault"
  key=var.key

}

module "bastion" {
  depends_on = [ module.resource_group,module.virtual-machine,module.Subnet ]
  source = "../../modules/azurerm-Bastion-Host"
  bastion=var.bastion

}

module "vnet-peering" {
  depends_on = [ module.virtual-network ]
  source = "../../modules/azurerm-vnet-peering"

}

module "mssql" {
  depends_on = [ module.resource_group, ]
  source = "../../modules/azurerm-mssql-server"

sql=var.sql

}