output "bucket_objects" {
  description = "List of bucket objects created by the keystore module"
  # On initial apply, metadata is null, causing diff on subsequent apply
  # Workaround: When metadata is null, force to an empty map
  value = [
    for object in aws_s3_bucket_object.this : object.metadata == null ? (
      merge(object, { metadata = {} })) : (
      object
    )
  ]
}

output "ssm_parameters" {
  description = "List of ssm parameter objects created by the keystore module"
  value       = var.backend == "ssm" ? aws_ssm_parameter.this[*] : []
}
