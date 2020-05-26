resource "google_composer_environment" "cloud_composer" {
  project = var.project_id
  name    = var.cloud_composer_name
  region  = var.region

  config {
    node_count = var.node_count
    node_config {
      zone            = var.zone
      machine_type    = var.machine_type
      service_account = var.service_account
      tags            = var.tags
      oauth_scopes    = var.oauth_scopes
    }
    software_config {
      airflow_config_overrides = var.airflow_config_overrides
      image_version  = var.image_version
      python_version = "3"
      pypi_packages  = var.requirements
    }
  }
}

resource "google_storage_bucket_object" "dags_folder" {
  for_each = fileset("../airflow", "dags/**")
  name     = each.value
  bucket   = local.cloud_compser_gcs_bucket
  source   = "../airflow/${each.value}"
}

resource "google_storage_bucket_object" "plugins_folder" {
  for_each = fileset("../airflow", "plugins/**")
  name     = each.value
  bucket   = local.cloud_compser_gcs_bucket
  source   = "../airflow/${each.value}"
}
