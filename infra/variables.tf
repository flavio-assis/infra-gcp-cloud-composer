variable "backend_bucket_name" {
  description = "Name of the bucket that will store terraform states"]
  type        = string
}

variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "service_account" {
  description = "Service Account that will be used to create Cloud Composer Environment"
  type        = string
}

variable "cloud_composer_name" {
  description = "Name of your Cloud Composer Instance"
  type        = "string"
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "Google Cloud Zone"
  type        = string
  default     = "us-east1-b"
}

variable "node_count" {
  description = "Number of nodes in Cloud Composer. Must be at least 3"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Google Compute Engine Machine type. Must be at least n1-standard-1"
  type        = string
  default     = "n1-standard-1"
}

variable "oauth_scopes" {
  description = "List of OAuth scopes for authentication"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "airflow_config_overrides" {
  description = "Configuration to override Cloud Composer airflow.cfg"
  type        = map(any)
  default     = {core-secure_mode = "True"}
}

variable "image_version" {
  description = "Cloud Composer image version"
  type        = string
  default     = "composer-1.10.0-airflow-1.10.6"
}

variable "requirements" {
  description = "Map of pypi packages used on Airflow's DAGs, Operators and Hooks"
  type = map(any)
  default = {}
}

variable "tags" {
  description = "Network Tags"
  type        = list(string)
  default     = []
}