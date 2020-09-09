resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  policy = file("iam/policy.json")
  role   = aws_iam_role.tf_lambda_role.id
}

resource "aws_iam_role" "tf_lambda_role" {
  name               = "tf_lambda_role"
  assume_role_policy = file("iam/assume_policy.json")
}
