module spanner {
  source = "../"

  project_id               = "project-id"
  instance_name            = "unique-instance-name"
  display_name             = "Display name for teh instance"
  version_retention_period = "How long time to be able to restore instance to a point in time"

  databases = [
    {
      name = "db-1"

      ddl = [
        "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
      ]
    },
    {
      name = "db-2"
    },
  ]
}
