resource "aws_s3_bucket" "b" {
  bucket = "firebase-users"
  acl    = "private"
}
