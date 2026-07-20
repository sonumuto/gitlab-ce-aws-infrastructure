resource "aws_instance" "nat_gateway_a" {
  ami           = data.aws_ami.arm64-al2023-ecs.image_id
  instance_type = "t4g.micro"

  availability_zone    = "eu-central-1a"
  iam_instance_profile = var.iam_instance_profile_name
  subnet_id            = var.subnet_a_id
  associate_public_ip_address = true
  source_dest_check = true
}