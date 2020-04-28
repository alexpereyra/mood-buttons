resource "aws_s3_bucket" "b" {
  bucket = "d-boxd.com"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://mind-pyramid.s3-website-us-east-1.amazonaws.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
