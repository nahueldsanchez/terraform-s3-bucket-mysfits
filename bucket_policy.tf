data "aws_iam_policy_document" "aws_bucket_policy_document" {
    statement {
        sid = "PublicReadForGetBucketObjects"
        effect = "Allow"

        principals {
            type = "*"
            identifiers = ["*"]
        }

        actions = [
            "s3:GetObject"
        ]

        resources = [
            "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
    }

}

resource "aws_s3_bucket_policy" "mysfits-s3-policy" {
    bucket = aws_s3_bucket.aws-mysfits-terraform.id
    policy = data.aws_iam_policy_document.aws_bucket_policy_document.json
}