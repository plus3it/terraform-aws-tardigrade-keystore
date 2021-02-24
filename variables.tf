variable "backend" {
  description = "Specify backend type for the keystore of keys and values: ddb, s3, or ssm"
  type        = string
  validation {
    condition     = contains(["s3", "ssm", "ddb"], var.backend)
    error_message = "The `backend` argument must be one of: `ddb`, `s3`, `ssm`."
  }
}

variable "keys_and_values" {
  description = "Map of keys and values to manage in the keystore"
  type        = map(string)
}

variable "backend_ddb" {
  description = "Configuration options for the ddb backend. Table must already exist, with Partition Key set to `Key`. Values will be added to the attribute `Value`. Required when `backend = \"ddb\"`"
  type = object({
    # Name of the DynamoDB table for the keystore
    table_name = string
  })
  default = null
}

variable "backend_s3" {
  description = "Configuration options for the s3 backend. Bucket must already exist. Required when `backend = \"s3\"`"
  type = object({
    # Name of the S3 bucket for the keystore
    bucket_name = string
    # MIME content type for the S3 objects
    content_type = string
  })
  default = null
}

variable "backend_ssm" {
  description = "Configuration options for the ssm backend. Required when `backend = \"ssm\"`"
  type = object({
    # KMS Key ID used to encrypt the parameter, when `type = "SecureString"`
    key_id = string
    # Type of parameter to create
    type = string
  })
  default = null
}

variable "namespace" {
  description = "Namespace used to prefix all keys in the keystore"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all keystore objects"
  type        = map(string)
  default     = {}
}
