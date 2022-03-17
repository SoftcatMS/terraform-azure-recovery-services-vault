data "azurerm_resource_group" "rsv" {
  name = var.resource_group_name
}

resource "azurerm_recovery_services_vault" "rsv" {
  name                         = var.name
  location                     = var.location
  resource_group_name          = data.azurerm_resource_group.rsv.name
  storage_mode_type            = var.storage_mode_type
  cross_region_restore_enabled = var.cross_region_restore_enabled
  soft_delete_enabled          = var.soft_delete_enabled
  sku                          = var.sku
  tags                         = var.tags

  identity {
    type = "SystemAssigned"
  }

}


resource "azurerm_backup_policy_vm" "backup_policy" {
  for_each            = var.backup_policies_vm
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rsv.name
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  timezone            = each.value.timezone


  backup {
    frequency = each.value.frequency
    time      = each.value.time
  }


  dynamic "retention_daily" {
    for_each = each.value.frequency != "Weekly" ? [1] : []
    content {
      count = each.value.count
    }
  }

  dynamic "retention_weekly" {
    for_each = each.value.frequency != "Daily" ? [1] : []
    content {
      count    = each.value.count
      weekdays = each.value.weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = each.value.retention_monthly != false ? [1] : []
    content {
      count    = each.value.count
      weekdays = each.value.weekdays
      weeks    = each.value.weeks
    }
  }

  dynamic "retention_yearly" {
    for_each = each.value.retention_yearly != false ? [1] : []
    content {
      count    = each.value.count
      weekdays = each.value.weekdays
      weeks    = each.value.weeks
      months   = each.value.months
    }
  }

}
