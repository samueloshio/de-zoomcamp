terraform {
    backend "local" {}
    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
    project     = var.project
    region      = var.region
    // credentials = file(var.credentials)
}

# Data Lake Bucket
resource "google_storage_bucket" "data-lake-bucket" {
  name          = "${local.data_lake_bucket}_${var.project}"
  location      = var.location
  force_destroy = true

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "default" {
  dataset_id = var.BQ_dataset
  project    = var.project
  location   = var.location
  # deletion_protection  = false
}

resource "google_bigquery_table" "default" {
    dataset_id = google_bigquery_dataset.default.dataset_id
    table_id   = var.BQ_table
    project    = var.project
    //location   = var.location
    
}