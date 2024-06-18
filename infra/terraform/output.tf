output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.photos.bucket
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.resize_photo.function_name
}
