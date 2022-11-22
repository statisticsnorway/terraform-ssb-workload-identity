variable "k8s_service_account" {
  type        = string
  description = "The name of the K8s service account for the application. If created by using the ssb-chart Helm chart, this is: <app-name>-sa."
}

variable "k8s_project_id" {
  type        = string
  description = "The GCP project where the K8s cluster runs. Usually staging-bip or prod-bip."
}

variable "k8s_namespace" {
  type        = string
  description = "The K8s namespace where the application runs. Usually your team name."
}

variable "project_id" {
  type        = string
  default     = null
  description = "The GCP project where the GCP WI service account will be created. Optional; defaults to the provider's project"
}

variable "name" {
  type        = string
  default     = null
  description = "The name of the GCP WI service account to be created. Optional; defaults to <k8s_service_account>-wi"
}
