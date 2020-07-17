variable "subnets" {
  type        = list(string)
  description = "List of Subnets"
}
variable "environment" {
  description = "Environment like dev, staging, prod"
}

variable "source_engine" {
  description = "Database engine to migrate"
}
variable "source_database_host" {
  description = "Database host to migrate"
}
variable "source_database_name" {
  description = "Source database"
}
variable "source_database_username" {
  description = "Source database user"
}
variable "source_database_password" {
  description = "Source database password"
}
variable "source_port" {
 description = "Source database port"
}

variable "application" {
  description = "Client application"
}

variable "client" {
  description = "Client name"
}
variable "target_engine" {
  description = "Target database engine"
}
variable "connection_attributes" {
  description = "Connection attributes"
}
variable "target_database_host" {
  description = "Target database host"
}
variable "target_database_name" {
  description = "Target database name"
}
variable "target_database_username" {
  description = "Target database user"
}
variable "target_database_password" {
  description = "Target database password"
}
variable "target_port" {
  description = "Target database port"
}
variable "ssl_mode" {
  description = "Enable SSL encryption"
}

variable "replication_task_settings" {
  description = "replication task settings"
}

variable "storage_size" {
  default = "30"
  description = "Replication task storage"
}
variable "dms_engine_version" {
  description = "Data migration service engine version"
}
variable "publicly_accessible" {
  description = "True if you want DMS instance to be accessible publicly"

}
variable "instance_type" {
  description = "Migration instance type"
}