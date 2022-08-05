# Provider configurations can be defined only in a root Terraform module.
# https://www.terraform.io/language/modules/develop/providers
provider "google" {
  region  = "europe-north1"
  zone    = "europe-north1-a"
  project = "dev-bip"
}

module "module-usage-example" {
  # It's recommended to reference a specific version of the module source
  # to avoid unexpected or unwanted changes
  # (https://www.terraform.io/language/modules/syntax#version)
  #source = "github.com/statisticsnorway/terraform-ssb-workload-identity?ref=v1.0.0"
  source = "../"

  k8s_service_account = "wi-test-app-sa"
  k8s_project_id = "staging-bip"
  k8s_namespace = "stratus"

  # These are optional
  #project_id = "dev-bip"
  #name = "test-app-wi-sa"
}

# A test bucket to use as an example
resource "google_storage_bucket" "wi_module_test_bucket" {
  name = "wi-module-test-bucket"
  location = "EU"
}

# Give the WI SA the storage admin role on the test bucket
resource "google_storage_bucket_iam_member" "wi_module_test_bucket_member" {
  bucket = google_storage_bucket.wi_module_test_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${module.module-usage-example.gcp_service_account_email}"
}
