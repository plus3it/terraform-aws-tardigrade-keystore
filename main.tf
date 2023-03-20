resource "aws_dynamodb_table_item" "this" {
  for_each = var.backend == "ddb" ? var.keys_and_values : {}

  item = jsonencode({
    Key   = { "S" : var.namespace == null ? each.key : "${var.namespace}/${each.key}" }
    Value = { "S" : each.value }
  })

  hash_key   = "Key"
  table_name = var.backend_ddb.table_name
}

resource "aws_s3_object" "this" {
  for_each = var.backend == "s3" ? var.keys_and_values : {}

  # S3 object keys *should not* start with the path separator ("/"), and should
  # not contain multiple adjacent path separators, e.g. "//"
  key = replace(
    replace(
      var.namespace == null ? each.key : "${var.namespace}/${each.key}",
      "///*/",
      "/",
    ),
    "/^//",
    ""
  )
  content = each.value

  bucket       = var.backend_s3.bucket_name
  content_type = var.backend_s3.content_type
  source_hash  = md5(each.value)
  tags         = var.tags

  lifecycle {
    postcondition {
      condition     = length(self.tags_all) <= 10
      error_message = "Cannot have more than 10 tags since that is the max for s3 objects, including provider default_tags. Received ${length(self.tags_all)} tags."
    }
  }
}

resource "aws_ssm_parameter" "this" {
  for_each = var.backend == "ssm" ? var.keys_and_values : {}

  # When using paths, SSM parameters *should* start with the path separator ("/"),
  # but SSM parameters should not have multiple adjacent path separators, e.g. "//"
  name = replace(
    var.namespace == null ? each.key : "/${var.namespace}/${each.key}",
    "///*/",
    "/",
  )
  value = each.value

  type   = var.backend_ssm.type
  key_id = var.backend_ssm.key_id
  tags   = var.tags
}
