provider "aws" {
    region = var.aws_region
}

resource "aws_dlm_lifecycle_policy" "example" {
    description        = "example DLM lifecycle policy"
    execution_role_arn = var.execution_role_arn
    state              = "ENABLED"

    policy_details {
        resource_types = ["INSTANCE"]

        schedule {
            name = "EBS Backup"

            create_rule {
                interval      = var.create_interval_hours
                interval_unit = "HOURS"
                times         = [var.backup_time_utc]
            }

            // Number of snapshots to keep on-hand
            retain_rule {
                count = var.retain_count
            }
            
            // Is this necessary?
            tags_to_add = {
                SnapshotCreator = "DLM"
            }

            copy_tags = false
        }

        // Which tag(s) to target for snapshots
        target_tags = {
            Snapshot = "true"
        }
    }
}