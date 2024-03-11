variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_subscription_id"{
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