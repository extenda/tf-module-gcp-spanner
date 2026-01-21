## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 6.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_spanner_backup_schedule.full-backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_backup_schedule) | resource |
| [google_spanner_database.spanner_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_database) | resource |
| [google_spanner_instance.spanner_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | The list of the database names, which cannot be changed after creation. Values are of the form [a-z][-a-z0-9]*[a-z0-9 | <pre>list(object({<br/>    name                      = string<br/>    ddl                       = optional(list(string))<br/>    dialect                   = optional(string)<br/>    enable_drop_protection    = optional(bool)<br/>    version_retention_period  = optional(string)<br/>    backup_schedule           = optional(string)<br/>    backup_retention_duration = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length. | `string` | n/a | yes |
| <a name="input_edition"></a> [edition](#input\_edition) | The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION\_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE\_PLUS. | `string` | n/a | yes |
| <a name="input_enable_autoscaling"></a> [enable\_autoscaling](#input\_enable\_autoscaling) | If true, the Spanner instance will use autoscaling. If false, it uses static num\_nodes or processing\_units. | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to force destroy the instance and its backups. | `bool` | `false` | no |
| <a name="input_high_priority_cpu_utilization_percent"></a> [high\_priority\_cpu\_utilization\_percent](#input\_high\_priority\_cpu\_utilization\_percent) | Target high priority CPU utilization percentage for autoscaling. | `number` | `65` | no |
| <a name="input_instance_config"></a> [instance\_config](#input\_instance\_config) | The name of the instance's configuration which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. | `string` | `"regional-europe-west1"` | no |
| <a name="input_instance_labels"></a> [instance\_labels](#input\_instance\_labels) | An object containing a list of key: value pairs | `map(string)` | <pre>{<br/>  "created": "terraform"<br/>}</pre> | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length. | `string` | n/a | yes |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Maximum number of nodes for autoscaling. At most one of either max\_nodes or max\_processing\_units can be present. Allowed values are multiples of 1 between 1 and 10. | `number` | `null` | no |
| <a name="input_max_processing_units"></a> [max\_processing\_units](#input\_max\_processing\_units) | Maximum number of processing units for autoscaling. At most one of either max\_nodes or max\_processing\_units can be present. Allowed values are multiples of 1000 between 1000 and 10000. | `number` | `null` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Minimum number of nodes for autoscaling. At most one of either min\_nodes or min\_processing\_units can be present. Allowed values are multiples of 1 between 1 and 10. | `number` | `null` | no |
| <a name="input_min_processing_units"></a> [min\_processing\_units](#input\_min\_processing\_units) | Minimum number of processing units for autoscaling. At most one of either min\_nodes or min\_processing\_units can be present. Allowed values are multiples of 1000 between 1000 and 10000. | `number` | `null` | no |
| <a name="input_num_nodes"></a> [num\_nodes](#input\_num\_nodes) | The number of nodes allocated to this instance. At most one of either node\_count or processing\_units can be present in terraform. | `string` | `null` | no |
| <a name="input_processing_units"></a> [processing\_units](#input\_processing\_units) | The number of processing units allocated to this instance. At most one of processing\_units or node\_count can be present in terraform. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. | `string` | n/a | yes |
| <a name="input_storage_utilization_percent"></a> [storage\_utilization\_percent](#input\_storage\_utilization\_percent) | Target storage utilization percentage for autoscaling. | `number` | `70` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_names"></a> [database\_names](#output\_database\_names) | An identifier for the resource with format {{instance}}/{{name}} |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | An identifier for the resource with format {{project}}/{{name}} |
