output "vpc_id" {
  description = "ID of the GitLab VPC."
  value       = aws_vpc.gitlab.id
}

output "public_subnet_a_id" {
  description = "ID of public subnet 10.0.0.0/24 (eu-central-1a)."
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "ID of public subnet 10.0.2.0/24 (eu-central-1b)."
  value       = aws_subnet.public_b.id
}

output "private_subnet_a_id" {
  description = "ID of private subnet 10.0.1.0/24 (eu-central-1a)."
  value       = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  description = "ID of private subnet 10.0.3.0/24 (eu-central-1b)."
  value       = aws_subnet.private_b.id
}