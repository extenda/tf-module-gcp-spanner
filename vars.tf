variable databases {
  type                       = list(object({
    name                     = string
    ddl                      = optional(list(string))
    dialect                  = optional(string)
    enable_drop_protection   = optional(bool)
    version_retention_period = optional(string)
    backup_schedule          = optional(string)
  }))
  description = "The list of the database names, which cannot be changed after creation. Values are of the form [a-z][-a-z0-9]*[a-z0-9"
  default     = []
}

variable default_backup_schedule_type {
  description = "Wether there should be a default daily backup schedule created for all databases in the instance. Possible values are: NONE, AUTOMATIC"
  default     = "NONE"
  type        = string
}

variable display_name {
  description = "The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length."
  type        = string
}

variable edition {
  description = "The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE_PLUS."
  type        = string
}

variable instance_config {
  description = "The name of the instance's configuration which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored."
  type        = string
  default     = "regional-europe-west1"
}

variable instance_name {
  description = "A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length."
  type        = string
}

variable instance_labels {
  description = "An object containing a list of key: value pairs"
  type        = map(string)
  default     = {
    "created" = "terraform"
  }
}

variable num_nodes {
  description = "The number of nodes allocated to this instance. At most one of either node_count or processing_units can be present in terraform."
  type        = string
  default     = null
}

variable processing_units {
  description = "The number of processing units allocated to this instance. At most one of processing_units or node_count can be present in terraform."
  type        = string
  default     = null
}

variable project_id {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable force_destroy {
  description = "The ID of the project in which the resource belongs."
  type        = bool
  default     = true
}
