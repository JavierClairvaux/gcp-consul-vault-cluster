resource "google_compute_network" "vault_vpc_network" {
	name 	    = "vault-vpc"
	description = "Vault cluster's VPC"
	project     = var.gcp_project
	auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vault_subnet" {
	name          = "vault-cluster-subnetwork"
	ip_cidr_range = var.vault_ip_cidr
	network       = google_compute_network.vault_vpc_network.self_link
	private_ip_google_access = true
}
