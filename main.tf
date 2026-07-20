provider "aws" {
  region = "eu-central-1"
}

module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source                    = "./modules/ec2"
  subnet_a_id               = module.vpc.public_subnet_a_id
  iam_instance_profile_name = module.iam.instance_profile_name
}
