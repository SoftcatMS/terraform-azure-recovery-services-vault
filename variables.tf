variable "name" {
  description = "Name of the MySQL Server. Changing this forces a new resource to be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
  type        = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "storage_mode_type" {
  description = "The storage type of the Recovery Services Vault."
  type        = string
  default     = "GeoRedundant"
}

variable "cross_region_restore_enabled" {
  description = "Is cross region restore enabled for this Vault?"
  type        = bool
  default     = false
}

variable "soft_delete_enabled" {
  description = "Is soft delete enable for this Vault? Defaults"
  type        = bool
  default     = true
}

variable "sku" {
  description = "Sets the vault's SKU. Possible values include: Standard, RS0."
  type        = string
  default     = "Standard"
}

variable "log_analytics_workspace" {
  description = "Name of the Log Analytics Workspace."
  type        = string
  default     = "UKS-LOG-SOFTCAT-MANAGEMENT"
}


variable "backup_policies_vm" {
  description = "Define vm backup Policy"
  type = map(object({
    name      = string
    frequency = string
    timezone  = string
    time      = string
    count     = number
    weekdays  = list(string)
  }))
  default = {}
}
