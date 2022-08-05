# terraform-ssb-workload-identity

This is a Terraform module for creating Google Workload Identity Service Accounts.

## Usage

See [the example module](./examples/main.tf) for an example of setting up workload identity and giving access to a bucket.

**Note:** For the workload identity to work, you have to annotate the Kubernetes service account with the email of the created GCP service account. The email is provided as output from this module. This can be done using the HelmRelease by specifying it in `spec.values`:

```yaml
serviceAccount:
  annotations:
    iam.gke.io/gcp-service-account: "wi-test-app-sa-wi@dev-bip.iam.gserviceaccount.com"
```

## Contributing

How to contribute:

* Clone this repo, create a branch locally, make changes
* Run `terraform fmt -recursive` to format the Terraform code
* Run `terraform-docs markdown . --indent=3 --anchor=false` and update the README file with the output
* Push your branch to the remote repo, create a pull request (PR) and notify the repo owners (Stratus owns this template repo)
* The repo owners review the PR, approve and merge the changes
* The repo owners create a new release (see [Versioning](#versioning))
* The repo owners notify users of the new release and update the repos that they are resposible for

### Versioning

This repository is versioned. We use [semantic versioning](https://semver.org/).

Please see GitHub´s [documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) describing how to create a new release.

## Terraform documentation

The following documentation is generated with `terraform-docs`:

```shell
terraform-docs markdown . --indent=3 --anchor=false
```

<!-- BEGINNING OF AUTO-GENERATED DOCS USING terraform-docs -->
### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| google | 4.31.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| module-usage-example | ../ | n/a |

### Resources

| Name | Type |
|------|------|
| [google_storage_bucket.wi_module_test_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.wi_module_test_bucket_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

### Inputs

No inputs.

### Outputs

No outputs.
<!-- END OF AUTO-GENERATED DOCS USING terraform-docs -->
