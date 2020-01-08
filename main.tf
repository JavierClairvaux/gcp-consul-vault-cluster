// Configure the Google Cloud provider

provider "google" {

 credentials = file(var.credentials_path)
 project     = var.gcp_project

 region      = var.gcp_region

}


