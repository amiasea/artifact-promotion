data "azurerm_resource_group" "target" {
  name = var.azure_resource_group_name
}

locals {
  parsed_metadata = jsondecode(var.artifact_metadata_json)

  processed_tags = {
    for key, value in local.parsed_metadata : "strata.${key}" => value if value != null
  }
}

resource "azapi_update_resource" "resource_group_tags" {
  type        = "Microsoft.Resources/resourceGroups@2021-04-01"
  resource_id = data.azurerm_resource_group.target.id

  body = {
    properties = {}

    tags = merge(
      data.azurerm_resource_group.target.tags,
      local.processed_tags
    )
  }
}

module "strata_hosting" {
  source                    = var.strata_hosting_module_source
  version                   = var.strata_hosting_module_version
  azure_resource_group_name = data.azurerm_resource_group.target.name

  depends_on = [azapi_update_resource.resource_group_tags]
}

module "strata_collective" {
  source                    = var.strata_collective_module_source
  version                   = var.strata_collective_module_version
  # azure_resource_group_name = data.azurerm_resource_group.target.name

  depends_on = [azapi_update_resource.resource_group_tags]
}
