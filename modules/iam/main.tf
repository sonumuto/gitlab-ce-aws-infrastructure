resource "aws_iam_policy" "gl_s3_policy" {
  name        = "gl-s3-policy"
  description = "IAM role for GitLab EC2 instance."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:PutObjectAcl",
        ],
        Resource = "arn:aws:s3:::gl-*/*",
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts",
          "s3:ListBucketMultipartUploads",
        ],
        Resource = "arn:aws:s3:::gl-*"
      }
    ]
  })
}

resource "aws_iam_role" "gitlab_s3_access" {
  name               = "GitLabS3Access"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_role_policy_attachment" "gl_s3" {
  role       = aws_iam_role.gitlab_s3_access.name
  policy_arn = aws_iam_policy.gl_s3_policy.arn
}

resource "aws_iam_instance_profile" "gitlab" {
  name = "gitlab-instance-profile"
  role = aws_iam_role.gitlab_s3_access.name
}
