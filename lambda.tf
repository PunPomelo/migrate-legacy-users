resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# resource "aws_lambda_permission" "allow_bucket1" {
#   statement_id  = "AllowExecutionFromS3Bucket1"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.func1.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = aws_s3_bucket.bucket.arn
# }

resource "aws_lambda_function" "func1" {
  filename      = "your-function1.zip"
  function_name = "example_lambda_name1"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.example"
  runtime       = "go1.x"
}
