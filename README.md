# terraform-module-template

This is a template repo, meant for use when creating new Terraform modules.

## Usage

[Create a repo based on this template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template).

The names for common Terraform modules and the repos containing them is typically on the form `terraform-ssb-<module_specific_name>`, e.g. `terraform-ssb-buckets`.

When you have created your module repo, go through the README and edit it so the content is suitable for your module.

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

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| google | >= 4.9.0 |

### Providers

No providers.

### Modules

No modules.

### Resources

No resources.

### Inputs

No inputs.

### Outputs

No outputs.
<!-- END OF AUTO-GENERATED DOCS USING terraform-docs -->
