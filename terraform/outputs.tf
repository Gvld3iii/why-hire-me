output "website_url" {
  value = "http://${aws_s3_bucket_website_configuration.site.website_endpoint}"
}
output "api_url" {
  value = aws_apigatewayv2_api.this.api_endpoint
}