# Bucket policy for S3 bucket, only allow from cloudfront distribution
data "aws_iam_policy_document" "web" {
  statement {
    effect    = "Allow"
    sid       = "CloudFrontAllowRead"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "ArnEquals"
      values   = [aws_cloudfront_distribution.web.arn]
      variable = "aws:SourceArn"
    }
  }
}

# Associate bucket policy to S3 bucket
resource "aws_s3_bucket_policy" "web" {
  bucket = aws_s3_bucket.web.id
  policy = data.aws_iam_policy_document.web.json
}
