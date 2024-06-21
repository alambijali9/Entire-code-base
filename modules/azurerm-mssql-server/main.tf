resource "azurerm_mssql_server" "server" {
  name                         = var.sql.server-name
  resource_group_name          = var.sql.resource_group_name
  location                     = var.sql.location
  version                      = var.sql.version
  administrator_login          = var.sql.administrator_login
  administrator_login_password = var.sql.administrator_login_password
}

resource "azurerm_mssql_database" "database" {
  name           = var.sql.database-name
  server_id      = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"

  }