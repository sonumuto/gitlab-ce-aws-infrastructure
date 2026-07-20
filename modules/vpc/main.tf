resource "aws_vpc" "gitlab" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "gitlab-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "gitlab-public-10.0.0.0"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "gitlab-private-10.0.1.0"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "gitlab-public-10.0.2.0"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.gitlab.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "gitlab-private-10.0.3.0"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gitlab.id

  tags = {
    Name = "gitlab-gateway"
  }
}

resource "aws_cloudwatch_log_group" "gitlab" {
  name = "gitlab_ce_log_group"
}

resource "aws_flow_log" "gitlab" {
  vpc_id          = aws_vpc.gitlab.id
  log_destination = aws_cloudwatch_log_group.gitlab.arn
  traffic_type    = "REJECT"
  iam_role_arn    = aws_iam_role.gitlab.arn
}

resource "aws_iam_role" "gitlab" {
  name               = "gitlab_ce_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
