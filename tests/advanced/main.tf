
# resource "azurerm_resource_group" "rg-rsv-test-advanced" {
#   name     = "rg-test-rsv-advanced-resources"
#   location = "uksouth"
# }


# module "advanced_rsv" {
#   source                       = "../../"
#   name                         = "rsv-uks-test-advanced"
#   location                     = "uksouth"
#   resource_group_name          = azurerm_resource_group.rg-rsv-test-advanced.name
#   storage_mode_type            = "GeoRedundant"
#   cross_region_restore_enabled = false
#   soft_delete_enabled          = false
#   sku                          = "Standard"

#   depends_on = [azurerm_resource_group.rg-rsv-test-advanced]

#   backup_policies_vm = {
#     daily-utc-0100 = {
#       name              = "daily-0100-utc-test-advanced"
#       frequency         = "Daily"
#       retention_monthly = false
#       retention_yearly  = false
#       timezone          = "UTC"
#       time              = "01:00"
#       count             = 7
#       weeks             = []
#       weekdays          = []
#       months            = []
#     },
#     weekly-utc-0100 = {
#       name              = "weekly-0100-utc-test-advanced"
#       frequency         = "Weekly"
#       retention_monthly = false
#       retention_yearly  = false
#       timezone          = "UTC"
#       time              = "01:00"
#       count             = 7
#       weekdays          = ["Monday"]
#       weeks             = []
#       months            = []
#     },
#     monthly-utc-0100 = {
#       name              = "monthly-0100-utc-test-advanced"
#       frequency         = "Daily"
#       retention_monthly = true
#       retention_yearly  = false
#       timezone          = "UTC"
#       time              = "01:00"
#       count             = 7
#       weekdays          = ["Monday"]
#       weeks             = ["First"]
#       months            = []
#     },
#     yearly-utc-0100 = {
#       name              = "yearly-0100-utc-test-advanced"
#       frequency         = "Weekly"
#       retention_monthly = false
#       retention_yearly  = true
#       timezone          = "UTC"
#       time              = "01:00"
#       count             = 7
#       weekdays          = ["Monday"]
#       weeks             = ["First"]
#       months            = ["January"]
#     }
#   }
# }
