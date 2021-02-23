resource "aws_s3_bucket" "firebase_users_bucket" {
  bucket = "firebase-users"
  acl    = "private"
}
