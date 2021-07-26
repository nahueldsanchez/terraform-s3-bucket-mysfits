terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_s3_bucket" "aws-mysfits-terraform" {
    bucket = var.s3_bucket_name

    website {
        index_document = "index.html"
    }
}

resource "aws_s3_bucket_object" "s3-upload-index" {
    bucket = aws_s3_bucket.aws-mysfits-terraform.id
    key = "index.html"
    content_type = "text/html"
    source = "${var.github_project_path}/module-1/web/index.html"
}

output "s3-domain-name" {
    value = aws_s3_bucket.aws-mysfits-terraform.website_endpoint
}