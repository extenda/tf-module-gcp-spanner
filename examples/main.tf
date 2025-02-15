module spanner {
  source = "../"

  project_id    = "project-id"
  instance_name = "unique-instance-name"
  edition       = "STANDARD"
  display_name  = "Display name for teh instance"

  databases = [
    {
      name = "db-1"

      ddl = [
        "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
      ]
    },
    {
      name                     = "db-2"
      version_retention_period = "7d"
      backup_schedule          = "0 2 * * *"
    },
  ]
}
