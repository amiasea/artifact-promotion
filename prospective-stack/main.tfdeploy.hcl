identity_token "azure" {
  audience = ["api://AzureADTokenExchange"]
}

store "varset" "prospective" {
  name     = "prospective"
  category = "terraform"
}

deployment "prospective" {
  inputs = {
    azure_tenant_id         = store.varset.prospective.azure_tenant_id
    azure_client_id         = store.varset.prospective.azure_client_id
    azure_subscription_id   = store.varset.prospective.azure_subscription_id
    azure_resource_group_id = store.varset.prospective.azure_resource_group_id
  }
}
