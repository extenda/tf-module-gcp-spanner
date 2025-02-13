# tf-module-gcp-spanner

## Description

This resource creates a spanner instance with optional databases and backup schedules.


## Providers

| Name | Version |
|------|---------|
| google | ~> 6.12.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| databases | list(map(string)) | The list of the database names and dialects, which cannot be changed after creation. Values are of the form `[a-z][-a-z0-9]*[a-z0-9]` | [] | yes |
| databases.backup_schedule | Backup schedule for the database. Cron expression as a string like `"0 1 * * *"` (daily full backup at 1am). | string | "" | no |
| databases.dialect | The dialect used for the database (GOOGLE_STANDARD_SQL or POSTGRESQL)` | string | GOOGLE_STANDARD_SQL | no
| databases.version_retention_period | The database version reteintion period | string | 7d | no
| databases.ddl | A list of DDL statements to run inside the newly created database. Statements can create tables, indexes, etc. These statements execute atomically with the creation of the database | list | [] | no
| display\_name | The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length. | string | n/a | yes |
| default\_backup\_schedule\_type | If set to AUTOMATIC a default backup schedule will be created for every new database in the instance | string | NONE | no |
| edition | The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE_PLUS. | string | STANDARD | yes |
| force\_destroy | When deleting a spanner instance, this boolean option will delete all backups of this instance. This must be set to true if you created a backup manually in the console. | bool | true | no |
| instance\_config | The name of the instance's configuration which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. | string | "regional-europe-west1" | no |
| instance\_name | A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length. | string | n/a | yes |
| labels | An object containing a list of key: value pairs | map(string) | { "created" = "terraform" } | no |
| num\_nodes | The number of nodes allocated to this instance. At most one of either node_count or processing_units can be present in terraform. | string | null | no |
| processing\_units | The number of processing units allocated to this instance. At most one of processing_units or node_count can be present in terraform. | string | null | no |
| project\_id | The ID of the project in which the resource belongs. | string | n/a | yes |
