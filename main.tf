provider "aws" {
  region = local.region
  profile = "lambidas"
}

locals {
  region = lookup(var._region, terraform.workspace)
}

output current_environment {
  value = local.region
}
