resource "azurerm_mssql_server" "sqlserver" {
    name = var.sqlserver_name
    resource_group_name = var.resource_group_name
    location = var.location
    version = "12.0"
    administrator_login = "dbadmin"
    administrator_login_password = "India@090909"
    minimum_tls_version = "1.2"
    public_network_access_enabled = "true"
    tags = {
        env =  var.env
    }
    
}

resource "time_sleep" "wait_60_seconds" {
  depends_on = [azurerm_mssql_server.sqlserver]
  create_duration = "120s"
}

resource "azurerm_mssql_database" "sqldb" {
    name = var.sqldb_name
    server_id  = azurerm_mssql_server.sqlserver.id
    create_mode = "Default"
    max_size_gb    = 2
    sku_name       = "Basic"
    tags = {
        env =  var.env
    }
}