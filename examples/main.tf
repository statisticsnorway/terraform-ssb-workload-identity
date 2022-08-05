# Provider configurations can be defined only in a root Terraform module.
# https://www.terraform.io/language/modules/develop/providers
provider "google" {
  region = "europe-north1"
  zone   = "europe-north1-a"
}

module "module-usage-example" {
  # It's recommended to reference a specific version of the module source
  # to avoid unexpected or unwanted changes
  # (https://www.terraform.io/language/modules/syntax#version)
  source = "github.com/statisticsnorway/terraform-module-template?ref=v1.0.0"
}
