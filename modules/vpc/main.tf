locals {
  # CIDR block => availability zone
  public_subnets = {
    "10.0.0.0/24" = "eu-central-1a"
    "10.0.2.0/24" = "eu-central-1b"
  }
  private_subnets = {
    "10.0.1.0/24" = "eu-central-1a"
    "10.0.3.0/24" = "eu-central-1b"
  }
}

resource "aws_vpc" "gitlab" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "gitlab-vpc"
  }
}

resource "aws_subnet" "public" {
  for_each = local.public_subnets

  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "gitlab-public-${split("/", each.key)[0]}"
  }
}

resource "aws_subnet" "private" {
  for_each = local.private_subnets

  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = false

  tags = {
    Name = "gitlab-private-${split("/", each.key)[0]}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gitlab.id

  tags = {
    Name = "gitlab-gateway"
  }
}
