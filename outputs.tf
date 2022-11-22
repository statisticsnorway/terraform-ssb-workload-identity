output "gcp_service_account_email" {
value       = google_service_account.wi_service_account.email
description = "The email for the created GCP service account. Can be used to grant roles on GCP resources."
}
