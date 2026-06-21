resource "aws_s3_bucket" "site" {
  bucket = "why-hire-me-tf-787548303162-us-east-1"
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id
  depends_on = [aws_s3_bucket_public_access_block.site]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.site.arn}/*"
      }
    ]
  })
}
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  source       = "../why-hire-me/index.html"
  content_type = "text/html"
  etag         = filemd5("../why-hire-me/index.html")
}

locals {
  images = [
    "chapter1_spark_collage.png",
    "chapter2_grind_collage.png",
    "chapter3_build_collage.png",
    "chapter4_proof_collage.png"
  ]
}

resource "aws_s3_object" "images" {
  for_each     = toset(local.images)
  bucket       = aws_s3_bucket.site.id
  key          = "images/${each.value}"
  source       = "../why-hire-me/images/${each.value}"
  content_type = "image/png"
  etag         = filemd5("../why-hire-me/images/${each.value}")
}
