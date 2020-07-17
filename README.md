# terraform-aws-database-migration-service
Module to migrate database to AWS


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application | Client application | `any` | n/a | yes |
| client | Client name | `any` | n/a | yes |
| connection\_attributes | Connection attributes | `any` | n/a | yes |
| dms\_engine\_version | Data migration service engine version | `any` | n/a | yes |
| environment | Environment like dev, staging, prod | `any` | n/a | yes |
| instance\_type | Migration instance type | `any` | n/a | yes |
| publicly\_accessible | True if you want DMS instance to be accessible publicly | `any` | n/a | yes |
| replication\_task\_settings | replication task settings | `any` | n/a | yes |
| source\_database\_host | Database host to migrate | `any` | n/a | yes |
| source\_database\_name | Source database | `any` | n/a | yes |
| source\_database\_password | Source database password | `any` | n/a | yes |
| source\_database\_username | Source database user | `any` | n/a | yes |
| source\_engine | Database engine to migrate | `any` | n/a | yes |
| source\_port | Source database port | `any` | n/a | yes |
| ssl\_mode | Enable SSL encryption | `any` | n/a | yes |
| storage\_size | Replication task storage | `string` | `"30"` | no |
| subnets | List of Subnets | `list(string)` | n/a | yes |
| target\_database\_host | Target database host | `any` | n/a | yes |
| target\_database\_name | Target database name | `any` | n/a | yes |
| target\_database\_password | Target database password | `any` | n/a | yes |
| target\_database\_username | Target database user | `any` | n/a | yes |
| target\_engine | Target database engine | `any` | n/a | yes |
| target\_port | Target database port | `any` | n/a | yes |

## Outputs

No output.
