terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.0"
    }
  }
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_credentials_key_file" {
  type = string
}

variable "gcp_region" {
  type    = string
  default = "europe-west1"
}

provider "google" {
  credentials = file(var.gcp_credentials_key_file)
  project     = var.gcp_project_id
  region      = var.gcp_region
}
