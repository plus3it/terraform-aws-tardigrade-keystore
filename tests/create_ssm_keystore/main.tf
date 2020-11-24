provider aws {
  region = "us-east-1"
}

resource "random_id" "this" {
  byte_length = 8
  prefix      = "tardigrade-keystore-"
}

resource "aws_kms_key" "this" {
  description = random_id.this.hex
}

module "create_ssm_keystore" {
  source = "../../"
  providers = {
    aws = aws
  }

  backend = "ssm"
  key_value_map = {
    "alpha" = "alpha",
    "beta"  = "beta",
    "gamma" = "gamma",
  }
  kms_key_id  = aws_kms_key.this.arn
  bucket_name = random_id.this.hex
}

output keystore {
  value = module.create_ssm_keystore
}
