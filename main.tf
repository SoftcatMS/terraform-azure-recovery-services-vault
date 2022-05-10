data "azurerm_resource_group" "rsv" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "rsv_workspace" {
  name = var.log_analytics_workspace
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


  # Daily Backup Policy
  dynamic "backup" {
    for_each = each.value.frequency != "Weekly" ? [1] : []
    content {
      frequency = each.value.frequency
      time      = each.value.time
    }
  }

  dynamic "retention_daily" {
    for_each = each.value.frequency != "Weekly" ? [1] : []
    content {
      count = each.value.count
    }
  }


  # Weekly Backup Policy
  dynamic "backup" {
    for_each = each.value.frequency != "Daily" ? [1] : []
    content {
      frequency = each.value.frequency
      weekdays  = each.value.weekdays
      time      = each.value.time
    }
  }

  dynamic "retention_weekly" {
    for_each = each.value.frequency != "Daily" ? [1] : []
    content {
      count    = each.value.count
      weekdays = each.value.weekdays
    }
  }

}


resource "azurerm_monitor_diagnostic_setting" "rsv_diag" {
  name                       = "${var.name}-diag"
  target_resource_id         = azurerm_recovery_services_vault.rsv.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.rsv_workspace.id

  log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }


}
