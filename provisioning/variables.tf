terraform {
  backend "s3" {
    bucket  = "ahildenrds-terraform-state-main"
    key     = "db2demords"
    region  = "us-west-2"
    profile = "rds-account"
  }
}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "us-west-2"
}

variable "identifier" {
   description = "Identifier that is used for the rds instance"
   type = string
   default = "db2demodb"
}

variable "aws_profile" {
  description = "Profile to use when provisioning - you will need to modify this."
  type        = string
  default     = "rds-account"
}

variable "db2_db_engine" {
  description = "Engine type - either db2-se or db2-ae"
  type        = string
  default     = "db2-se"
  validation {
    condition     = contains(["db2-se", "db2-ae"], var.db2_db_engine)
    error_message = "The environment must be either 'db2-se' or 'db2-ae'."
  }
}

variable "major_engine_version" {
  description = "The engine version - currently only 11.5 is available"
  type        = string
  default     = "11.5"
}

variable "db2_engine_version" {
    description = "The version of the Db2 engine to deploy"
    type = string
    default = "11.5.9.0.sb00000000.r1"
}

variable "db2_db_parm_family" {
  description = "Engine type - either db2-se-11.5 or db2-ae-11.5"
  type        = string
  default     = "db2-se-11.5"
  validation {
    condition     = contains(["db2-se-11.5", "db2-ae-11.5"], var.db2_db_parm_family)
    error_message = "The environment must be either 'db2-se-11.5' or 'db2-ae-11.5' and match the db2_db_engine"
  }
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t3.small"
}

variable "username" {
  description = "The admin user name."
  type        = string
  default     = "admin"
}

variable "database_name" {
  description = "The name of the Db2 database to create in the instance"
  type        = string
  default     = ""
}

variable "port" {
  description = "The port used to connect to the instance"
  type        = string
  default     = "50000"
}

variable "storage" {
  description = "The port used to connect to the instance"
  type        = number
  default     = 20
}

variable "maintenance_window" {
  description = "Weekly maintenance window of the database instance"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  description = "Daily backup window of the database instance"
  type        = string
  default     = "03:00-06:00"
}

variable "tag_owner" {
    description = "Tag detailing the owner of the deployment"
    type = string
    default = "Default Owner"
}

variable "tag_environment" {
    description = "Tag detailing the environment"
    type = string
    default = "Default"
}

variable "ibm_site_id" {
    description = "Site ID - from passport advantage"
    type = string
    default = "0123456"
}

variable "ibm_customer_id" {
    description = "Customer ID - from passport advantage"
    type = string
    default = "7121121"
}


