data "azurerm_resource_group" "current_resource_group" {
  name = var.azure_resource_group
}

data "azurerm_kubernetes_cluster" "current_aks_cluster" {
  name                = var.aks_cluster_name
  resource_group_name = data.azurerm_resource_group.current_resource_group.name
}