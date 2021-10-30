terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.0"
    }
  }
}

provider "google" {
  credentials = file(var.gcp_credentials_key_file)
  project     = var.gcp_project_id
  region      = var.gcp_region
}
