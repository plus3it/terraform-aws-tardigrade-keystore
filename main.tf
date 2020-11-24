locals {
  keys = keys(var.key_value_map)

  #list of possible backend types support by the keystore module
  backends = [
    "s3",
    "ssm",
  ]

  #test input backend provide by the users
  is_backend_valid = contains(local.backends, var.backend)
}

resource "null_resource" "is_backend_valid" {
  # forces/outputs an error when var.backend is invalid
  count = local.is_backend_valid ? 1 : 0

  triggers = {
    assert_is_valid = local.is_backend_valid == false ? file("ERROR: var.backend (${var.backend}) is invalid. Must be one of: ${join(", ", local.backends)}") : null
  }
}

resource "aws_s3_bucket_object" "this" {
  for_each = var.backend == "s3" ? var.key_value_map : {}

  bucket       = var.bucket_name
  key          = each.key
  content      = each.value
  content_type = "application/json"
  etag         = md5(each.value)
  tags         = var.tags
}

resource "aws_ssm_parameter" "this" {
  for_each = var.backend == "ssm" ? var.key_value_map : {}

  type   = "SecureString"
  name   = replace("/${var.bucket_name}/${each.key}", "////", "/", )
  value  = each.value
  key_id = var.kms_key_id
  tags   = var.tags
}
