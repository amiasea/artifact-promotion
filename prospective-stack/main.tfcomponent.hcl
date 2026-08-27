component "hosting" {
  source = "git::https://github.com/amiasea/strata-artifact.git//terraform/hosting?ref=development"

  inputs = {
    azure_resource_id = var.azure_resource_group_id
  }

  providers = {
    azurerm = provider.azurerm.main
  }
}

component "collective" {
  source = "git::https://github.com/amiasea/strata-artifact.git//terraform/collective?ref=development"

  inputs = {
    azure_resource_id = var.azure_resource_group_id
  }

  providers = {
    azurerm = provider.azurerm.main
  }
}

component "kitting" {
  source = "git::https://github.com/amiasea/kitting-artifact.git//terraform/?ref=development"

  inputs = {
    azure_resource_id = var.azure_resource_group_id
  }

  providers = {
    azurerm = provider.azurerm.main
  }
}