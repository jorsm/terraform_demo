terraform {
    required_providers {

        # per le chiamate a Google Cloud
        google = {
            source = "hashicorp/google"
            version = "5.32.0"
        }
    
        # per zippare i sorgenti delle cloud functions
        archive = {
        source = "hashicorp/archive"
        version = "2.4.2"
        }
    }
    # Remote state

#     backend "gcs" {
#         bucket  = "terraform-demo-257-bucket"
#         prefix  = "terraform/state"
#     }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  # credentials = file(var.credentials_file) 
}