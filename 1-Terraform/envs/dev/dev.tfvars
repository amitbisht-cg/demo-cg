env                 = "dev"
resource_group_name = "demo-rg"
location = "centralindia"
tfstorage_account = "demostorageaccount0093"
tfstatecontainer = "demotfcontainer"
vnet_name = "demo-vnet"
vnet_address = ["10.0.0.0/16"]
subnets = [
    {
        name = "demo-web-sub"
        address = ["10.0.1.0/24"]
    },
    {
        name = "demo-app-sub"
        address = ["10.0.2.0/24"]
    }
]

sqlserver_name = "demosqlserver0093"
sqldb_name = "demoDB"

web_prefix = "web"
app_prefix = "app"
web_count = 2
app_count = 2
vm_size = "Standard_B1s"