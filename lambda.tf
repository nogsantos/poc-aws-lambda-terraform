locals {
  _dist = "dist"
}

// Build layers to publish

# data "archive_file" "libs-lambda_layers_zip" {
#   type        = "zip"
#   source_dir  = "../package/python" # It is part another repository
#   output_path = "${local._dist}/libs-lambda_layers.zip"
# }

# resource "aws_lambda_layer_version" "libs" {
#   # filename            = "${local._dist}/lambda_layers.zip"
#   # source_code_hash    = data.archive_file.libs-lambda_layers_zip.output_base64sha256
#   layer_name          = "libs"
#   # compatible_runtimes = ["python3.7", "python3.8"]

#   provisioner "local-exec" {
#     command = "echo first"
#     # command = "set -eo pipefail && rm -rf package && cd src pip install --target ../package/python -r requirements.txt"
#   }
# }

// Try to dynamic load and create lambdas

# locals {
#   lambda_functions = fileexists("${var.base_path}/lambdas/lambda_functions.json") ? 
#   jsondecode(
#     templatefile(
#       "${var.base_path}/lambdas/lambda_functions.json", { 
#         client = var.client, 
#         stage  = var.stage, 
#         random = random_id.lambda.b64_url, 
#         kwargs = var.lambda_functions_kwargs 
#       }
#     )
#   ) : null
# }

# resource "aws_lambda_function" "lambdas" {
#   for_each      = local.lambda_functions
#   function_name = "${each.value.function_name}-${random_id.lambda.b64_url}"
#   filename      = "${path.module}/lambdas/${each.value.function_name}/${each.value.function_name}-${random_id.lambda.b64_url}.zip"
#   handler       = "${each.value.function_name}-${random_id.lambda.b64_url}.lambda_handler"
#   role          = aws_iam_role.lambdas[each.key].arn
#   runtime       = "python3.8"
#   timeout       = 60
#   lifecycle {
#     ignore_changes = [filename, last_modified]
#   }
#   environment {
#     variables = each.value.environment
#   }
# }

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
