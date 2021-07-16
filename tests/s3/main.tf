resource "random_id" "this" {
  byte_length = 8
  prefix      = "tardigrade-keystore-"
}

resource "aws_s3_bucket" "this" {
  bucket = random_id.this.hex
}

# Skip the "namespace" logic
module "keystore" {
  source = "../../"

  backend = "s3"

  backend_s3 = {
    bucket_name  = aws_s3_bucket.this.id
    content_type = "application/json"
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

  backend   = "s3"
  namespace = random_id.this.hex

  backend_s3 = {
    bucket_name  = aws_s3_bucket.this.id
    content_type = "application/json"
  }

  keys_and_values = {
    "alpha" = "ALPHA"
    "beta"  = "BETA"
    "gamma" = "GAMMA"
  }
}

output "keystore" {
  value = module.keystore
}

output "keystore_namespace" {
  value = module.keystore_namespace
}
