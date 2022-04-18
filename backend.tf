resource "aws_s3_bucket" "bastion_logs" {
  bucket = "tf-bastion-logs"
}

resource "aws_s3_bucket_ownership_controls" "bastion_logs" {
  bucket = aws_s3_bucket.bastion_logs.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}