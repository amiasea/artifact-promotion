variable "azure_tenant_id" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_resource_group_name" {
  description = "The specific pre-allocated resource group slot index assigned for this integration run (e.g., rg-s-1)."
  type        = string
  validation {
    condition     = can(regex("^rg-s-[0-9]+$", var.azure_resource_group_name))
    error_message = "The resource group name must match an authorized integration slot (e.g., 'rg-s-1')."
  }
}

variable "strata_hosting_module_source" {
  description = "The strata hosting module source."
  type        = string
  const       = true
}

variable "strata_hosting_module_version" {
  description = "The strata hosting module version, when applicable."
  type        = string
  const       = true
  default     = null
}

variable "strata_collective_module_source" {
  description = "The strata collective module source."
  type        = string
  const       = true
}

variable "strata_collective_module_version" {
  description = "The strata collective module version, when applicable."
  type        = string
  const       = true
  default     = null
}

variable "artifact_metadata_json" {
  description = "A raw JSON string passed by the amiasea API containing the structured metadata payload."
  type        = string
}
