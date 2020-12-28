provider "aws" {
  region = "us-east-1"
}

resource "random_id" "this" {
  byte_length = 8
  prefix      = "tardigrade-keystore-"
}

resource "aws_s3_bucket" "this" {
  bucket = random_id.this.hex
}

module "create_s3_keystore" {
  source = "../../"
  providers = {
    aws = aws
  }

  backend = "s3"
  key_value_map = {
    "alpha" = "alpha",
    "beta"  = "beta",
    "gamma" = "gamma",
  }
  bucket_name = aws_s3_bucket.this.id
}

output "keystore" {
  value = module.create_s3_keystore
}
