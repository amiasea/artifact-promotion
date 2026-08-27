# Speculative Strata
resource "azurerm_resource_group" "prospective_environment" {
  name      = "prospective"
  location  = var.location
}

resource "azurerm_resource_group" "operative_environment" {
  name      = "operative"
  location  = var.location
}