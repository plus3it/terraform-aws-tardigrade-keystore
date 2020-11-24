# terraform-aws-tardigrade-keystore

Terraform module to create a keystore within S3/SSM


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend | Specify which backend to store the keys and values: s3 or ssm | `string` | `"s3"` | no |
| bucket\_name | Name of the keystore S3 bucket, must already exist. For SSM Parameter, bucket name will be used as prefix for the parameter names | `string` | `null` | no |
| key\_value\_map | Map of keys and values | `map(string)` | `{}` | no |
| kms\_key\_id | Specify the KMS key id or arn for encrypting SecureString. Only applicable for "ssm" backend | `string` | `""` | no |
| tags | A map of tags to add to the keystore objects | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_objects | List of bucket objects created by the keystore module |
| ssm\_parameters | List of ssm parameter objects created by the keystore module |

<!-- END TFDOCS -->
