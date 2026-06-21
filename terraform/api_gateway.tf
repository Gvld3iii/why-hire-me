resource "aws_apigatewayv2_api" "this" {
  name          = "why-hire-me-api-tf"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "OPTIONS"]
    allow_headers = ["Content-Type"]
  }
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = "$default"
  auto_deploy = true
}

# --- Pitch ---
resource "aws_apigatewayv2_integration" "pitch" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.pitch.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "pitch" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "GET /pitch"
  target    = "integrations/${aws_apigatewayv2_integration.pitch.id}"
}

resource "aws_lambda_permission" "pitch" {
  statement_id  = "AllowAPIGatewayInvokePitch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.pitch.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
}

# --- Story ---
resource "aws_apigatewayv2_integration" "story" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.story.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "story" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "GET /story"
  target    = "integrations/${aws_apigatewayv2_integration.story.id}"
}

resource "aws_lambda_permission" "story" {
  statement_id  = "AllowAPIGatewayInvokeStory"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.story.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
}

# --- Project ---
resource "aws_apigatewayv2_integration" "project" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.project.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "project" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "GET /project"
  target    = "integrations/${aws_apigatewayv2_integration.project.id}"
}

resource "aws_lambda_permission" "project" {
  statement_id  = "AllowAPIGatewayInvokeProject"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.project.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
}

# --- Contact ---
resource "aws_apigatewayv2_integration" "contact" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.contact.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "contact" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "POST /contact"
  target    = "integrations/${aws_apigatewayv2_integration.contact.id}"
}

resource "aws_lambda_permission" "contact" {
  statement_id  = "AllowAPIGatewayInvokeContact"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.contact.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
}