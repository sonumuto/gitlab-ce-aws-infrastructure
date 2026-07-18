# gitlab-ce-aws-infrastructure

Terraform configuration for running **GitLab CE** on AWS. Where possible it
favors AWS Free Tier services to keep the setup simple and low-cost.

This is a personal learning project, built incrementally. GitLab's own
recommended AWS installation is documented here:
<https://docs.gitlab.com/install/aws/>.

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.2
- AWS provider >= 6.23.0
- AWS credentials configured (e.g. via `aws login` preffered)

## Layout

```
.
├── main.tf         # Root: provider + module wiring
├── variables.tf    # Root input variables
├── terraform.tf    # Terraform + provider version constraints
└── modules/
    └── iam/        # IAM role/policy granting GitLab EC2 access to S3
```

The root module owns the AWS provider; child modules inherit it.

### Modules

| Module | Purpose |
| ------ | ------- |
| `iam`  | Creates an IAM role, S3 access policy, and role attachment for the GitLab EC2 instance. |

## Usage

```sh
terraform init      # download providers, initialize modules
terraform plan      # preview changes
terraform apply     # create/update resources
```

Region currently defaults to `eu-central-1`.
