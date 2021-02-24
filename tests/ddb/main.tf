provider "aws" {
  region = "us-east-1"
}

resource "random_id" "this" {
  byte_length = 8
  prefix      = "tardigrade-keystore-"
}

resource "aws_dynamodb_table" "this" {
  name     = random_id.this.hex
  hash_key = "Key"

  write_capacity = 1
  read_capacity  = 1

  attribute {
    name = "Key"
    type = "S"
  }
}

# Skip the "namespace" logic
module "keystore" {
  source = "../../"

  backend = "ddb"

  backend_ddb = {
    table_name = aws_dynamodb_table.this.name
  }

  keys_and_values = {
    "alpha" = "ALPHA",
    "beta"  = "BETA",
    "gamma" = "GAMMA",
  }
}

# Exercise the "namespace" logic
module "keystore_namespace" {
  source = "../../"

  backend   = "ddb"
  namespace = random_id.this.hex

  backend_ddb = {
    table_name = aws_dynamodb_table.this.name
  }

  keys_and_values = {
    "alpha" = "ALPHA",
    "beta"  = "BETA",
    "gamma" = "GAMMA",
  }
}

output "keystore" {
  value = module.keystore
}

output "keystore_namespace" {
  value = module.keystore_namespace
}
