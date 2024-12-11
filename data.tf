data "azurerm_subscription" "current_subscription" {
  subscription_id = var.azure_subscription_id
}

data "azurerm_resource_group" "current_resource_group" {
  name = var.azure_resource_group
}

data "azurerm_kubernetes_cluster" "current_aks_cluster" {
  name                = var.aks_cluster_name
  resource_group_name = data.azurerm_resource_group.current_resource_group.name
}

data "azurerm_subscription" "managed_subscriptions" {
  for_each        = toset(var.managed_subscription_ids)
  subscription_id = each.key
}