resource "azurerm_user_assigned_identity" "otterize_operator_managed_identity" {
  name                = "ottr-k8s-operator-managed-identity"
  location            = data.azurerm_resource_group.current_resource_group.location
  resource_group_name = data.azurerm_resource_group.current_resource_group.name
}

resource "azurerm_role_assignment" "assign_otterize_operator_resource_group_owner" {
  scope                = data.azurerm_resource_group.current_resource_group.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.otterize_operator_managed_identity.principal_id

  depends_on = [
    azurerm_user_assigned_identity.otterize_operator_managed_identity,
  ]
}

resource "azurerm_federated_identity_credential" "intents_operator_federated_identity_credential" {
  name                = "ottr-k8s-operator-intents-federated-identity-credential-${var.aks_cluster_name}"
  resource_group_name = data.azurerm_resource_group.current_resource_group.name
  issuer              = data.azurerm_kubernetes_cluster.current_aks_cluster.oidc_issuer_url
  subject             = "system:serviceaccount:${var.otterize_deploy_namespace}:intents-operator-controller-manager"
  audience            = ["api://AzureADTokenExchange"]
  parent_id           = azurerm_user_assigned_identity.otterize_operator_managed_identity.id

  depends_on = [
    azurerm_user_assigned_identity.otterize_operator_managed_identity,
  ]
}

resource "azurerm_federated_identity_credential" "credentials_operator_federated_identity_credential" {
  name                = "ottr-k8s-operator-credentials-federated-identity-credential-${var.aks_cluster_name}"
  resource_group_name = data.azurerm_resource_group.current_resource_group.name
  issuer              = data.azurerm_kubernetes_cluster.current_aks_cluster.oidc_issuer_url
  subject             = "system:serviceaccount:${var.otterize_deploy_namespace}:credentials-operator-controller-manager"
  audience            = ["api://AzureADTokenExchange"]
  parent_id           = azurerm_user_assigned_identity.otterize_operator_managed_identity.id

  depends_on = [
    azurerm_user_assigned_identity.otterize_operator_managed_identity,
  ]
}