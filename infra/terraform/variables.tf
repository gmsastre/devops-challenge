variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "photos_bucket" {
  description = "S3 bucket for photos"
  type        = string
  default     = "my-photo-bucket"
}
