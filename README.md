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

* Clone this repo, create a branch locally, make changes (remember to run the tests)
* Run `terraform fmt -recursive` to format the Terraform code
* Run `terraform-docs markdown . --indent=3 --anchor=false` and update the README file with the output
* Push your branch to the remote repo, create a pull request (PR) and notify the repo owners (Stratus owns this repo)
* The repo owners review the PR, approve and merge the changes
* The repo owners create a new release (see [Versioning](#versioning))
* The repo owners notify users of the new release and update the repos that they are responsible for

### Testing

terraform-compliance - <https://terraform-compliance.com/>

Write Behavior Driven Development (BDD) tests as documented [here](https://terraform-compliance.com/pages/bdd-references/). Tests can be written alongside examples by defining features in .feature-files.

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

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| google | >= 4.9.0 |

### Providers

| Name | Version |
|------|---------|
| google | >= 4.9.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [google_service_account.wi_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.wi_k8s_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| k8s\_namespace | The K8s namespace where the application runs. Usually your team name. | `string` | n/a | yes |
| k8s\_project\_id | The GCP project where the K8s cluster runs. Usually staging-bip or prod-bip. | `string` | n/a | yes |
| k8s\_service\_account | The name of the K8s service account for the application. If created by using the ssb-chart Helm chart, this is: <app-name>-sa. | `string` | n/a | yes |
| name | The name of the GCP WI service account to be created. Optional; defaults to <k8s\_service\_account>-wi | `string` | `null` | no |
| project\_id | The GCP project where the GCP WI service account will be created. Optional; defaults to the provider's project | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| gcp\_service\_account\_email | The email for the created GCP service account. Can be used to grant roles on GCP resources. |

<!-- END OF AUTO-GENERATED DOCS USING terraform-docs -->
