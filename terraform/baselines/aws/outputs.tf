output "cloudtrail_arn" {
  value = aws_cloudtrail.mgmt.arn
}

output "cloudtrail_bucket" {
  value = aws_s3_bucket.trail.bucket
}
