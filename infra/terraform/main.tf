provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "photos" {
  bucket = var.photos_bucket
}

resource "aws_lambda_function" "resize_photo" {
  filename         = "${path.module}/functions/resizePhoto/resizePhoto.zip"
  function_name    = "resizePhoto"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "index.handler"
  source_code_hash = filebase64sha256("${path.module}/functions/resizePhoto/resizePhoto.zip")
  runtime          = "nodejs14.x"

  environment {
    variables = {
      PHOTOS_BUCKET = var.photos_bucket
      AWS_REGION    = var.aws_region
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
