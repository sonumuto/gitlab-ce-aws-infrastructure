provider "aws" {
  region = "eu-central-1"
}

module "iam" {
  source = "./modules/iam"
}
