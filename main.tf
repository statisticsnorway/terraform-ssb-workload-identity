locals {
  gcp_sa_account_id = var.name != null ? var.name : "${var.k8s_service_account}-wi"
  gcp_iam_member = "serviceAccount:${var.k8s_project_id}.svc.id.goog[${var.k8s_namespace}/${var.k8s_service_account}]"
}

resource "google_service_account" "wi_service_account" {
  account_id   = local.gcp_sa_account_id
  project      = var.project_id
  display_name = "Workload Identity service account"
  description  = "Workload Identity GCP service account linked to the ${var.k8s_service_account} K8s service account"
}

resource "google_service_account_iam_member" "wi_k8s_member" {
  service_account_id = google_service_account.wi_service_account.name
  role               = "roles/iam.workloadIdentityUser"
  member             = local.gcp_iam_member
}
