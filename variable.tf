variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "azure_resource_group" {
  description = "Azure Resource Group"
  type        = string
}

variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "otterize_deploy_namespace" {
  description = "The namespace Otterize is deployed in"
  type        = string
  default     = "otterize-system"
}

variable "managed_subscription_ids" {
  description = "To allow the operator to manage access to resources outside the provided AKS cluster's subscription, provide a list of additional subscription IDs"
  type    = list(string)
  default = []
}