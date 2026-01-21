module "spanner" {
  source = "../"

  project_id       = "project-id"
  instance_name    = "unique-instance-name"
  edition          = "STANDARD"
  display_name     = "Display name for the instance"
  processing_units = "100"
  instance_config  = "regional-europe-west1"
  force_destroy    = false



  databases = [
    {
      name = "db-1"

      ddl = [
        "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
      ]
    },
    {
      name                      = "db-2"
      version_retention_period  = "7d"
      backup_schedule           = "0 2 * * *"
      backup_retention_duration = "604800s" # 7 days in seconds
    },
  ]
}
