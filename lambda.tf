locals {
  _dist = "dist"
}

data "archive_file" "do_something_cool" {
  type        = "zip"
  source_file = "src/do_something_cool.py"
  output_path = "${local._dist}/do_something_cool.zip"
}

resource "aws_lambda_function" "do_something_cool" {
  filename         = "${local._dist}/do_something_cool.zip"
  function_name    = "do_something"
  handler          = "do_something_cool.do_something"
  runtime          = "python3.8"
  role             = aws_iam_role.tf_lambda_role.arn
  source_code_hash = data.archive_file.do_something_cool.output_base64sha256
}
