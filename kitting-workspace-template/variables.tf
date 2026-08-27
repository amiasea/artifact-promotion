variable "azure_tenant_id" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_resource_group_name" {
  description = "The specific pre-allocated resource group slot index assigned for this integration run (e.g., rg-k-1)."
  type        = string
  validation {
    condition     = can(regex("^rg-k-[0-9]+$", var.azure_resource_group_name))
    error_message = "The resource group name must match an authorized integration slot (e.g., 'rg-k-1')."
  }
}

variable "kitting_module_source" {
  description = "The kitting module source."
  type        = string
  const       = true
}

variable "kitting_module_version" {
  description = "The kitting module version, when applicable."
  type        = string
  const       = true
  default     = null
}

variable "artifact_metadata_json" {
  description = "A raw JSON string passed by the amiasea API containing the structured metadata payload."
  type        = string
}
