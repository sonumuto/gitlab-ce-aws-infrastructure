output "instance_profile_name" {
  description = "Name of the instance profile to attach to GitLab EC2 instances."
  value       = aws_iam_instance_profile.gitlab.name
}
