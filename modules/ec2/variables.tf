variable "subnet_a_id" {
  description = "ID of the subnet a to launch the NAT instance in."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to attach to the NAT instance."
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair to use for SSH access."
  type        = string
  default     = "nat_key_pair"
}
