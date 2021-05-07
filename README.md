# terraform-aws-tardigrade-keystore

Terraform module to create a keystore within S3/SSM


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend"></a> [backend](#input\_backend) | Specify backend type for the keystore of keys and values: ddb, s3, or ssm | `string` | n/a | yes |
| <a name="input_keys_and_values"></a> [keys\_and\_values](#input\_keys\_and\_values) | Map of keys and values to manage in the keystore | `map(string)` | n/a | yes |
| <a name="input_backend_ddb"></a> [backend\_ddb](#input\_backend\_ddb) | Configuration options for the ddb backend. Table must already exist, with Partition Key set to `Key`. Values will be added to the attribute `Value`. Required when `backend = "ddb"` | <pre>object({<br>    # Name of the DynamoDB table for the keystore<br>    table_name = string<br>  })</pre> | `null` | no |
| <a name="input_backend_s3"></a> [backend\_s3](#input\_backend\_s3) | Configuration options for the s3 backend. Bucket must already exist. Required when `backend = "s3"` | <pre>object({<br>    # Name of the S3 bucket for the keystore<br>    bucket_name = string<br>    # MIME content type for the S3 objects<br>    content_type = string<br>  })</pre> | `null` | no |
| <a name="input_backend_ssm"></a> [backend\_ssm](#input\_backend\_ssm) | Configuration options for the ssm backend. Required when `backend = "ssm"` | <pre>object({<br>    # KMS Key ID used to encrypt the parameter, when `type = "SecureString"`<br>    key_id = string<br>    # Type of parameter to create<br>    type = string<br>  })</pre> | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace used to prefix all keys in the keystore | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all keystore objects | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ddb_items"></a> [ddb\_items](#output\_ddb\_items) | Map of ddb table item objects created by the keystore module |
| <a name="output_s3_objects"></a> [s3\_objects](#output\_s3\_objects) | Map of S3 bucket objects created by the keystore module |
| <a name="output_ssm_parameters"></a> [ssm\_parameters](#output\_ssm\_parameters) | Map of ssm parameter objects created by the keystore module |

<!-- END TFDOCS -->
