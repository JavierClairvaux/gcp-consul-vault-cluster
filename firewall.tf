resource "google_compute_firewall" "vault_firewall" {
	name    = "vault-cluster-firewall"
	network = google_compute_network.vault_vpc_network.name

	allow {
		protocol = "icmp"
	}

	// Consul ports
	allow {
		protocol = "tcp"
		ports    = ["22", "8600", "8500", "8501", "8502", "8301", "8302", "8300", "21000-21255" ]
	}

	allow {
		protocol = "udp"
		ports    = ["8600",  "8301", "8302" ]
	}


	// Vault ports
	allow {
		protocol = "tcp"
		ports    = ["7300", "7301", "8200", "8201" ]
	}

	allow {
		protocol = "udp"
		ports    = ["7301" ]
	}
	
	source_ranges = [var.vault_ip_cidr, var.my_public_ip]
}
