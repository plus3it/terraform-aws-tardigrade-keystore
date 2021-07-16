resource "random_id" "this" {
  byte_length = 8
  prefix      = "tardigrade-keystore-"
}

resource "aws_kms_key" "this" {
  description = random_id.this.hex
}

# Skip the "namespace" logic
module "keystore" {
  source = "../../"

  backend = "ssm"

  backend_ssm = {
    key_id = aws_kms_key.this.id
    type   = "SecureString"
  }

  keys_and_values = {
    "alpha" = "ALPHA"
    "beta"  = "BETA"
    "gamma" = "GAMMA"
  }
}

# Exercise the "namespace" logic
module "keystore_namespace" {
  source = "../../"

  backend   = "ssm"
  namespace = random_id.this.hex

  backend_ssm = {
    key_id = aws_kms_key.this.id
    type   = "SecureString"
  }

  keys_and_values = {
    "alpha" = "ALPHA"
    "beta"  = "BETA"
    "gamma" = "GAMMA"
  }
}

output "keystore" {
  value     = module.keystore
  sensitive = true
}

output "keystore_namespace" {
  value     = module.keystore_namespace
  sensitive = true
}
