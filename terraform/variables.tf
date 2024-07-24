variable "project_id" {
 type = string
 nullable = false
 description = "The project ID to deploy to."
}

variable "region" {
 type = string
 nullable = false
 default = "europe-west1"
 description = "The region to deploy to."
}

variable "bucket_name" {
 type = string

}

variable cloud_funtion_sources_folder{
     type = string
    default = "../cloud_functions"
    description = "The region to deploy to."

}
