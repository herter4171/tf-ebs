variable "aws_region" {
    description = "AWS region to apply snapshot policy."
}

variable "create_interval_hours" {
    description = "Interval in hours to make snaphots."
    default = 24
}

variable "retain_count" {
    description = "Number of snapshots to retain."
    default = 10
}

variable "backup_time_utc" {
    description = "Time to create an EBS snapshot."
    default = "02:00"
}

variable "execution_role_arn" {
    description = "ARN of execution role "
}