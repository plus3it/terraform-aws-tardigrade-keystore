output "s3_objects" {
  description = "Map of S3 bucket objects created by the keystore module"
  # On initial apply, some attributes are null, causing diff on subsequent apply
  # Workaround: When attributes are null, force to an empty map
  value = var.backend == "s3" ? {
    for key, object in aws_s3_object.this : key => merge(
      object,
      {
        metadata = object.metadata == null ? {} : object.metadata
        tags     = object.tags == null ? {} : object.tags
      }
    )
  } : {}
}

output "ssm_parameters" {
  description = "Map of ssm parameter objects created by the keystore module"
  # On initial apply, some attributes are null, causing diff on subsequent apply
  # Workaround: When attributes are null, force to an empty map
  value = var.backend == "ssm" ? {
    for key, object in aws_ssm_parameter.this : key => merge(
      object,
      {
        tags = object.tags == null ? {} : object.tags
      }
    )
  } : {}
}

output "ddb_items" {
  description = "Map of ddb table item objects created by the keystore module"
  value       = var.backend == "ddb" ? aws_dynamodb_table_item.this : {}
}
