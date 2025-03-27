provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.identifier

  engine            = var.db2_db_engine
  engine_version    = var.db2_engine_version
  instance_class    = var.instance_class
  allocated_storage = var.storage

  db_name  = var.database_name
  username = var.username
  port     = var.port

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window


  tags = {
    Owner       = var.tag_owner
    Environment = var.tag_environment
  }

  # DB parameter group
  family = var.db2_db_parm_family

  # DB option group
  major_engine_version = var.major_engine_version


  parameters = [
    {
      name  = "rds.ibm_site_id"
      value = var.ibm_site_id
    },
    {
      name  = "rds.ibm_customer_id"
      value = var.ibm_customer_id
    }
  ]
}
