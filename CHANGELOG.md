## terraform-aws-tardigrade-keystore Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### [5.0.0](https://github.com/plus3it/terraform-aws-tardigrade-keystore/releases/tag/5.0.0)

**Released**: 2023.03.20

**Summary**:

*   Uses postcondition to create a plan-time failure when s3 object tags exceed limit

### 4.0.0

**Released**: 2022.08.24

**Commit Delta**: [Change from 3.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/3.0.0...4.0.0)

**Summary**:

*   Requires aws provider v4
*   Replaces deprecated aws_s3_bucket_object with aws_s3_object
*   Detects changes using source_hash instead of etag to support encrypted buckets

### 3.0.0

**Released**: 2021.02.23

**Commit Delta**: [Change from 2.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/2.0.0...3.0.0)

**Summary**:

*   Makes the keystore backends more "pluggable" by using dedicated objects for
    attributes distinct to each backend type
*   Modifies outputs to be maps of the key names to the keystore objects
*   Adds DynamoDB as a supported keystore backend

### 2.0.0

**Released**: 2020.11.24

**Commit Delta**: [Change from 1.0.5 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.5...2.0.0)

**Summary**:

*   Removes module-wide "create" variable, relying on module-level `count` in terraform
    0.13 for a better version of the same functionality

### 1.0.5

**Released**: 2020.10.15

**Commit Delta**: [Change from 1.0.4 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.4...1.0.5)

**Summary**:

*   Restores outputs to expected format

### 1.0.4

**Released**: 2020.10.14

**Commit Delta**: [Change from 1.0.3 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.3...1.0.4)

**Summary**:

*   Eliminates spurious diff on second apply due to null metadata

### 1.0.3

**Released**: 2019.10.28

**Commit Delta**: [Change from 1.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.2...1.0.3)

**Summary**:

*   Pins tfdocs-awk version
*   Updates documentation generation make targets
*   Adds documentation to the test modules

### 1.0.2

**Released**: 2019.10.17

**Commit Delta**: [Change from 1.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.1...1.0.2)

**Summary**:

*   Adds ability to auto approve and merge Dependabot PRs

### 1.0.1

**Released**: 2019.10.03

**Commit Delta**: [Change from 1.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/1.0.0...1.0.1)

**Summary**:

*   Update testing harness to have a more user-friendly output
*   Update terratest dependencies

### 1.0.0

**Released**: 2019.09.11

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-keystore/compare/0.0.0...1.0.0)

**Summary**:

*   Upgrade to terraform 0.12.x
*   Add test cases

### 0.0.0

**Commit Delta**: N/A

**Released**: 2019.08.23

**Summary**:

*   Initial release!
