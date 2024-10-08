resource "google_spanner_instance" "spanner_instance" {
  name             = var.instance_name
  project          = var.project_id
  edition          = var.edition
  config           = var.instance_config
  display_name     = var.display_name
  num_nodes        = var.num_nodes
  labels           = var.instance_labels
  processing_units = var.processing_units
  force_destroy    = var.force_destroy
}

resource "google_spanner_database" "spanner_database" {
  for_each = {
    for db in var.databases :
    db.name => db
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
  deletion_protection = lookup(each.value, "deletion_protection", false)
  depends_on = [google_spanner_instance.spanner_instance]
}
