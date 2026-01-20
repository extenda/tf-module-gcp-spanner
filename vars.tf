variable "databases" {
  type = list(object({
    name                      = string
    ddl                       = optional(list(string))
    dialect                   = optional(string)
    enable_drop_protection    = optional(bool)
    version_retention_period  = optional(string)
    backup_schedule           = optional(string)
    backup_retention_duration = optional(string)
  }))
  description = "The list of the database names, which cannot be changed after creation. Values are of the form [a-z][-a-z0-9]*[a-z0-9"
  default     = []
}

variable "display_name" {
  description = "The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length."
  type        = string
}

variable "edition" {
  description = "The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE_PLUS."
  type        = string
}

variable "instance_config" {
  description = "The name of the instance's configuration which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored."
  type        = string
  default     = "regional-europe-west1"
}

variable "instance_name" {
  description = "A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length."
  type        = string
}

variable "instance_labels" {
  description = "An object containing a list of key: value pairs"
  type        = map(string)
  default = {
    "created" = "terraform"
  }
}

variable "num_nodes" {
  description = "The number of nodes allocated to this instance. At most one of either node_count or processing_units can be present in terraform."
  type        = string
  default     = null
}

variable "processing_units" {
  description = "The number of processing units allocated to this instance. At most one of processing_units or node_count can be present in terraform."
  type        = string
  default     = null
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the instance and its backups."
  type        = bool
  default     = false
}

# Autoscaling related variables
variable "enable_autoscaling" {
  description = "If true, the Spanner instance will use autoscaling. If false, it uses static num_nodes or processing_units."
  type        = bool
  default     = false
}

variable "min_processing_units" {
  description = "Minimum number of processing units for autoscaling. At most one of either min_nodes or min_processing_units can be present. Allowed values are multiples of 1000 between 1000 and 10000."
  type        = number
  default     = null
}

variable "max_processing_units" {
  description = "Maximum number of processing units for autoscaling. At most one of either max_nodes or max_processing_units can be present. Allowed values are multiples of 1000 between 1000 and 10000."
  type        = number
  default     = null
}

variable "min_nodes" {
  description = "Minimum number of nodes for autoscaling. At most one of either min_nodes or min_processing_units can be present. Allowed values are multiples of 1 between 1 and 10."
  type        = number
  default     = null
}

variable "max_nodes" {
  description = "Maximum number of nodes for autoscaling. At most one of either max_nodes or max_processing_units can be present. Allowed values are multiples of 1 between 1 and 10."
  type        = number
  default     = null
}

variable "high_priority_cpu_utilization_percent" {
  description = "Target high priority CPU utilization percentage for autoscaling."
  type        = number
  default     = 65
}

variable "storage_utilization_percent" {
  description = "Target storage utilization percentage for autoscaling."
  type        = number
  default     = 70
}