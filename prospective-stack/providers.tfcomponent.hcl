required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 5.1.0"
  }
}

provider "azurerm" "main" {
  config {
    tenant_id       = var.azure_tenant_id
    client_id       = var.azure_client_id
    subscription_id = var.azure_subscription_id

    use_oidc = true

    features {}
  }
}
