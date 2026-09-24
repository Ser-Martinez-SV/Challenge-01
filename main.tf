terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

locals {
  bucket_name = "challenge-789654"
}

resource "aws_s3_bucket" "bucket_challenge"{
    bucket             = "challenge-789654"
    object_lock_enabled = false
}

resource "aws_s3_bucket_website_configuration" "bucket_challenge" {
    bucket = local.bucket_name

    index_document {
        suffix = "index.html"
    }
}

resource "aws_s3_bucket_public_access_block" "bucket_challenge" {
    bucket = local.bucket_name

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_challenge" {
    bucket = local.bucket_name

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${local.bucket_name}/*"
    }]
    })

    depends_on = [aws_s3_bucket_public_access_block.bucket_challenge]
}

output "website_url" {
    value = "http://${local.bucket_name}.s3-website-us-east-1.amazonaws.com"
}
