resource "random_id" "id" {
  byte_length = 8
}

resource "aws_dms_replication_subnet_group" "replication-subnet-group" {
  replication_subnet_group_description = "Replication subnet group for ${var.application}"
  replication_subnet_group_id          = "dms-subnet-group-${random_id.id.hex}"

  subnet_ids = var.subnets

  tags = {
    Name        = "${var.client} DMS subnet group"
    Description = "Managed by Terraform"
    Env         = var.environment
    Owner       = var.client
  }
}


resource "aws_dms_replication_instance" "replication-instance" {
  allocated_storage           = var.storage_size
  apply_immediately           = true
  auto_minor_version_upgrade  = true
  engine_version              = var.dms_engine_version
  publicly_accessible         = var.publicly_accessible
  replication_instance_class  = var.instance_type
  replication_instance_id     = "dms-replication-instance-${random_id.id.hex}"
  replication_subnet_group_id = "${aws_dms_replication_subnet_group.replication-subnet-group.id}"

  tags = {
    Name        = "${var.client} Replication Instance"
    Description = "Managed by Terraform"
    Env         = var.environment
    Application = var.application
    Owner       = var.client
  }
}

resource "aws_dms_endpoint" "source" {
  endpoint_id                 = "dms-source-endpoint-${random_id.id.hex}"
  endpoint_type               = "source"
  engine_name                 = var.source_engine
  extra_connection_attributes = var.connection_attributes
  server_name                 = var.source_database_host
  database_name               = var.source_database_name
  username                    = var.source_database_username
  password                    = var.source_database_password
  port                        = var.source_port
  ssl_mode                    = var.ssl_mode

  tags = {
    Name        = "${var.client} Source Endpoint"
    Description = "Managed by Terraform"
    Application = "${var.application}"
    Owner       = var.client
    Env         = var.environment
  }
}


resource "aws_dms_endpoint" "target" {
  endpoint_id                 = "dms-target-endpoint-${random_id.id.hex}"
  endpoint_type               = "target"
  engine_name                 = var.target_engine
  extra_connection_attributes = var.connection_attributes
  server_name                 = var.target_database_host
  database_name               = var.target_database_name
  username                    = var.target_database_username
  password                    = var.target_database_password
  port                        = var.target_port
  ssl_mode                    = var.ssl_mode

  tags = {
    Name        = "${var.client} Target Endpoint"
    Description = "Managed by Terraform"
    Application = var.application
    Env         = var.environment
    Owner       = var.client
  }
}

resource "aws_dms_replication_task" "replication-task" {
  migration_type           = "full-load-and-cdc"
  replication_instance_arn = aws_dms_replication_instance.replication-instance.replication_instance_arn
  replication_task_id      = "dms-replication-task-${random_id.id.hex}"

  source_endpoint_arn = aws_dms_endpoint.source.endpoint_arn
  target_endpoint_arn = aws_dms_endpoint.target.endpoint_arn

  table_mappings            = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"%\",\"table-name\":\"%\"},\"rule-action\":\"include\"}]}"
  replication_task_settings = var.replication_task_settings

  tags = {
    Name        = "${var.client} Replication Task"
    Owner       = var.client
    Application = var.application
    Description = "Managed by Terraform"
    Env         = var.environment
  }
}