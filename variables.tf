variable "github_project_path" {
    description = "Path to the code repository (local)"
    type = string
    default = "</home/user/aws-modern-application-workshop/"
}

variable "aws_region" {
    description = "Amazon region used to launch the EC2 instance"
    type = string
    default = "us-west-2"
}

variable "s3_bucket_name" {
    description = "Name for the S3 bucket to be created"
    type = string
    default = "aws-mysfits-terraform"
}