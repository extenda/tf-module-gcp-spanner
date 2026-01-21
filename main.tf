resource "google_spanner_instance" "spanner_instance" {
  name                         = var.instance_name
  project                      = var.project_id
  edition                      = var.edition
  config                       = var.instance_config
  display_name                 = var.display_name
  labels                       = var.instance_labels
  force_destroy                = var.force_destroy
  default_backup_schedule_type = "NONE"

  # ---------------------------------------------------------
  # COMPUTE CONFIGURATION
  # If autoscaling is enabled, we MUST set static fields to null
  # to avoid conflicts.
  # ---------------------------------------------------------
  num_nodes        = var.enable_autoscaling ? null : var.num_nodes
  processing_units = var.enable_autoscaling ? null : var.processing_units

  # ---------------------------------------------------------
  # AUTOSCALING CONFIGURATION
  # Only creates this block if enable_autoscaling is true
  # ---------------------------------------------------------
  dynamic "autoscaling_config" {
    for_each = var.enable_autoscaling ? [1] : []
    content {
      autoscaling_limits {
        # You can scale by Nodes OR Processing Units. 
        # Ensure your variables provide one set or the other.
        min_processing_units = var.min_processing_units
        max_processing_units = var.max_processing_units
        min_nodes            = var.min_nodes
        max_nodes            = var.max_nodes
      }
      autoscaling_targets {
        high_priority_cpu_utilization_percent = try(var.high_priority_cpu_utilization_percent, 65)
        storage_utilization_percent           = try(var.storage_utilization_percent, 70)
      }
    }
  }
}

resource "google_spanner_database" "spanner_database" {
  for_each = {
    for db in var.databases : db.name => db
  }

  instance                 = google_spanner_instance.spanner_instance.name
  name                     = each.value.name
  database_dialect         = each.value.dialect
  project                  = var.project_id
  version_retention_period = try(each.value.version_retention_period, "1h")
  ddl                      = try(each.value.ddl, [])

  dynamic "encryption_config" {
    for_each = (lookup(each.value, "kms_key_name", "") != "") ? [each.value.kms_key_name] : []
    content {
      kms_key_name = lookup(each.value, "kms_key_name", null)
    }
  }
  deletion_protection    = try(each.value.deletion_protection, false)
  enable_drop_protection = try(each.value.enable_drop_protection, true)
  depends_on             = [google_spanner_instance.spanner_instance]
}

resource "google_spanner_backup_schedule" "full-backup" {
  for_each = {
    for db in var.databases : db.name => db
    if db.backup_schedule != null
  }

  instance           = google_spanner_instance.spanner_instance.name
  database           = each.value.name
  project            = var.project_id
  name               = each.value.name
  retention_duration = each.value.backup_retention_duration == null ? "604800s" : each.value.backup_retention_duration

  spec {
    cron_spec {
      //   0 2 * * *    : once a day at 2 past midnight in UTC.
      //   0 2 * * 0    : once a week every Sunday at 2 past midnight in UTC.
      //   0 2 8 * *    : once a month on 8th day at 2 past midnight in UTC.
      text = try(each.value.backup_schedule, "0 2 * * *")
    }
  }
  // The schedule creates incremental backup chains.
  full_backup_spec {}

  depends_on = [google_spanner_database.spanner_database]
}
