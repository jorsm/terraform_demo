# Bucket per lo stato di terraform, per permettere il locking e la condivisione dello stato
# https://cloud.google.com/docs/terraform/resource-management/store-state

# API Necessarie
resource "google_project_service" "services" {
  for_each = toset(["iam","cloudfunctions"])

  project                    = var.project_id
  service                    = "${each.key}.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = true
}

# Il Bucket che contiene 
# - il codice della CF
# - lo stato di terraform
resource "google_storage_bucket" "gcs_bucket" {
  name          = var.bucket_name
  force_destroy = false
  location      = var.region
  storage_class = "STANDARD"

  public_access_prevention = "enforced"
  versioning {
    enabled = true
  }
}

### CLOUD FUNCTION #####

# # Zip del codice della Cloud Function
# data "archive_file" "test_function_zip_source" {
#   type        = "zip"
#   output_path = "/tmp/test_function/.zip"
#   source_dir  = "${path.module}/${var.cloud_funtion_sources_folder}/test_function"
#   excludes    = [".dist/**", ".vscode/**"]
# }

# # Oggetto sul bucket
# resource "google_storage_bucket_object" "test_function_zip_souce_bucket_object" {
#   name   = "${data.archive_file.test_function_zip_source.output_sha}.zip"
#   bucket = google_storage_bucket.gcs_bucket.id
#   source = data.archive_file.test_function_zip_source.output_path
# }

# # Cloud Function
# resource "google_cloudfunctions_function" "function" {
#   name        = "test_function"
#   description = "Cloud Function creata con Terraform"
#   runtime     = "python312"

#   available_memory_mb          = 128
#   source_archive_bucket        = google_storage_bucket.gcs_bucket.name
#   source_archive_object        = google_storage_bucket_object.test_function_zip_souce_bucket_object.name
#   trigger_http                 = true
#   https_trigger_security_level = "SECURE_ALWAYS"
#   timeout                      = 60
#   entry_point                  = "hello_http"
#   labels = {
#     my-label = "my-label-value"
#   }

#   environment_variables = {
#     MY_ENV_VAR = "my-env-var-value"
#   }
# }

# # Service Account
# resource "google_service_account" "service_account" {
#   account_id   = "cf-invoker"
#   display_name = "Cloud Functions Invoker Service Account"
# }

# # IAM Cloud functions Invoker
# resource "google_cloudfunctions_function_iam_member" "invoker" {
#   depends_on = [ google_service_account.service_account ]
#   project        = google_cloudfunctions_function.function.project
#   region         = google_cloudfunctions_function.function.region
#   cloud_function = google_cloudfunctions_function.function.name

#   role   = "roles/cloudfunctions.invoker"
#   member = "serviceAccount:${google_service_account.service_account.email}"
# }