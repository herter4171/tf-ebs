# tf-ebs
This repository houses what's needed to establish necessary policies in both GovCloud regions for creating EBS snapshots at a specified interval, along with managing their lifecycle by having an upper limit on the number of snapshots to keep for a given instance.  Parameters that control this are found under `./ebs/variables.tf`, and more specifically, they are
* `create_interval_hours`
* `retain_count`
* `backup_time_utc`

## Setup
For an instance to be subject to this backup scheme, they need to match what's within `target_tags` under `./ebs/main.tf`.  There isn't much nuance to deploying the infrastructure code, just the standard Terraform sequence of
```
./terraform init
./terraform apply
```

## Remaining Work
* Determine the viability of EBS snapshots from an active root volume
* Encrypt all EBS snapshots at rest