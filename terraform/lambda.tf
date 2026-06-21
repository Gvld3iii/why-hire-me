data "archive_file" "pitch_zip" {
  type        = "zip"
  output_path = "${path.module}/pitch.zip"
  source {
    content  = file("../why-hire-me/why_pitch.py")
    filename = "lambda_function.py"
  }
}

data "archive_file" "story_zip" {
  type        = "zip"
  output_path = "${path.module}/story.zip"
  source {
    content  = file("../why-hire-me/story_handler.py")
    filename = "lambda_function.py"
  }
}

data "archive_file" "project_zip" {
  type        = "zip"
  output_path = "${path.module}/project.zip"
  source {
    content  = file("../why-hire-me/project_handler.py")
    filename = "lambda_function.py"
  }
}

data "archive_file" "contact_zip" {
  type        = "zip"
  output_path = "${path.module}/contact.zip"
  source {
    content  = file("../why-hire-me/contact_handler.py")
    filename = "lambda_function.py"
  }
}

resource "aws_lambda_function" "pitch" {
  function_name    = "why-hire-me-pitch-tf"
  role             = aws_iam_role.read_only_lambda.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.13"
  filename         = data.archive_file.pitch_zip.output_path
  source_code_hash = data.archive_file.pitch_zip.output_base64sha256
}

resource "aws_lambda_function" "story" {
  function_name    = "why-hire-me-story-tf"
  role             = aws_iam_role.read_only_lambda.arn
  handler          = "lambda_function.story_handler"
  runtime          = "python3.13"
  filename         = data.archive_file.story_zip.output_path
  source_code_hash = data.archive_file.story_zip.output_base64sha256
}

resource "aws_lambda_function" "project" {
  function_name    = "why-hire-me-project-tf"
  role             = aws_iam_role.read_only_lambda.arn
  handler          = "lambda_function.project_handler"
  runtime          = "python3.13"
  filename         = data.archive_file.project_zip.output_path
  source_code_hash = data.archive_file.project_zip.output_base64sha256
}

resource "aws_lambda_function" "contact" {
  function_name    = "why-hire-me-contact-tf"
  role             = aws_iam_role.contact_lambda.arn
  handler          = "lambda_function.contact_handler"
  runtime          = "python3.13"
  filename         = data.archive_file.contact_zip.output_path
  source_code_hash = data.archive_file.contact_zip.output_base64sha256
}