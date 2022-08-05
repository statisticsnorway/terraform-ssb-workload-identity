# Best practices with setting terraform version
# https://www.terraform.io/language/expressions/version-constraints#terraform-core-and-provider-versions
terraform {
  required_version = ">= 1.0.0"

  # Example of a provider and its version
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.9.0"
    }
  }
}
