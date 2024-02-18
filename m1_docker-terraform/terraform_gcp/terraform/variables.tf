locals {
  data_lake_bucket = "nyc-taxi-data"
}

variable "credentials" {
  description = "My Credentials"
  default     = "<Path to your Service Account json file>"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "dtc-de-414207"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "us-west1 (Oregon)"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}

variable "BQ_dataset" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default     = "green_tripdata"
  # deletion_protection = false
}

variable "BQ_table" {
  description = "My BigQuery Table Name"
  #Update the below to a unique bucket name
  #default     = "${local.data_lake_bucket}_{var.project}"
  default     = "ny_taxi_tripdata"
  # deletion_protection = false
}

variable "bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  #default     = "${local.data_lake_bucket}_{var.project}"
  default     = ""
}

variable "storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}