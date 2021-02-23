resource "aws_iam_role" "lambda_exec" {
  name               = "LambdaS3"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_role" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "migrateFirebaseUsers" {
  function_name = "migrateFirebaseUsers"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "lambda-migrate-users"
  s3_key    = "v1.0.0/lambda.zip"

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "migrateFirebaseUsers.handler"
  runtime = "nodejs14.x"

  role = aws_iam_role.lambda_exec.arn
}
