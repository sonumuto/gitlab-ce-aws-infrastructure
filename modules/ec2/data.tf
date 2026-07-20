data "aws_ami" "arm64-al2023-ecs" {
  owners      = ["amazon"]
  name_regex  = "^al2023-ami-ecs"
  most_recent = true

  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}
