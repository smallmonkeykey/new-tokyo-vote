provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "tokyu-vote-app-bucket"

  tags = {
    Name = "Railway App Bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "my_bucket_ownership_controls" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_iam_policy" "s3_read_write_policy" {
  name        = "S3ReadWritePolicy"
  description = "Allow read and write access to the S3 bucket from Railway app"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_user" "railway_app_user" {
  name = "RailwayAppUser"
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.railway_app_user.name
  policy_arn = aws_iam_policy.s3_read_write_policy.arn
}

resource "aws_iam_access_key" "railway_app_access_key" {
  user = aws_iam_user.railway_app_user.name
}
