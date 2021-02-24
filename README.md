# terraform-aws-tardigrade-keystore

Terraform module to create a keystore within S3/SSM


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend | Specify backend type for the keystore of keys and values: ddb, s3, or ssm | `string` | n/a | yes |
| keys\_and\_values | Map of keys and values to manage in the keystore | `map(string)` | n/a | yes |
| backend\_ddb | Configuration options for the ddb backend. Table must already exist, with Partition Key set to `Key`. Values will be added to the attribute `Value`. Required when `backend = "ddb"` | <pre>object({<br>    # Name of the DynamoDB table for the keystore<br>    table_name = string<br>  })</pre> | `null` | no |
| backend\_s3 | Configuration options for the s3 backend. Bucket must already exist. Required when `backend = "s3"` | <pre>object({<br>    # Name of the S3 bucket for the keystore<br>    bucket_name = string<br>    # MIME content type for the S3 objects<br>    content_type = string<br>  })</pre> | `null` | no |
| backend\_ssm | Configuration options for the ssm backend. Required when `backend = "ssm"` | <pre>object({<br>    # KMS Key ID used to encrypt the parameter, when `type = "SecureString"`<br>    key_id = string<br>    # Type of parameter to create<br>    type = string<br>  })</pre> | `null` | no |
| namespace | Namespace used to prefix all keys in the keystore | `string` | `null` | no |
| tags | A map of tags to add to all keystore objects | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| ddb\_items | Map of ddb table item objects created by the keystore module |
| s3\_objects | Map of S3 bucket objects created by the keystore module |
| ssm\_parameters | Map of ssm parameter objects created by the keystore module |

<!-- END TFDOCS -->
