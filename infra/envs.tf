locals {
  cloud_compser_gcs_bucket = trimsuffix(trimprefix(google_composer_environment.cloud_composer.config.0.dag_gcs_prefix, "gs://"), "/dags")
}