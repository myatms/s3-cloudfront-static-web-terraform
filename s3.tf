resource "aws_s3_bucket" "web" {
  bucket        = var.bucket_name
  force_destroy = true

}
# Block all public access
resource "aws_s3_bucket_public_access_block" "web" {
  bucket = aws_s3_bucket.web.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "web" {
  bucket = aws_s3_bucket.web.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

}
