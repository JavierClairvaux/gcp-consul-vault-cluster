resource "google_compute_instance_group" "vault-servers" {

  name        = "terraform-vault-servers"
  description = "vault servers with terraform and packer"



  instances = [
    google_compute_instance.vault_1.self_link,
    google_compute_instance.vault_2.self_link,
  ]


  zone = var.gcp_zone 

}

resource "google_compute_instance" "vault_1" {
        name         = "vault-server-1"
        machine_type = var.vault-server-type
	zone 	     = var.gcp_zone 
        metadata = {
                sshKeys = "${var.ssh-user}:${file(var.ssh-key)}"
        }

        metadata_startup_script = "/home/${var.ssh-user}/provisioner.sh ${var.vault_name_1} ${var.consul_dc} ${var.encrytp_key} ${google_compute_instance.consul_1.network_interface.0.network_ip} ${var.gcp_project} ${var.key_ring_location} ${var.key_ring} ${var.crypto_key}"

        boot_disk {
                initialize_params {
                        image = var.vault-image
                }
        }
        network_interface {
                subnetwork = google_compute_subnetwork.vault_subnet.self_link
        }
       
	 # Service account with Cloud KMS roles for the Compute Instance
	service_account {
		email  = google_service_account.vault_kms_service_account.email
		scopes = ["cloud-platform", "compute-rw", "userinfo-email", "storage-ro"]
  	  }
	
	depends_on = [  google_compute_subnetwork.vault_subnet,
			google_compute_instance.consul_1,
			google_compute_instance.consul_2,
			google_compute_instance.consul_3,
			]
}

resource "google_compute_instance" "vault_2" {
        name         = "vault-server-2"
        machine_type = var.vault-server-type
	zone 	     = var.gcp_zone 
        metadata = {
                sshKeys = "${var.ssh-user}:${file(var.ssh-key)}"
        }


        metadata_startup_script = "/home/${var.ssh-user}/provisioner.sh ${var.vault_name_2} ${var.consul_dc} ${var.encrytp_key} ${google_compute_instance.consul_1.network_interface.0.network_ip} ${var.gcp_project} ${var.key_ring_location} ${var.key_ring} ${var.crypto_key}"
        
	boot_disk {
                initialize_params {
                        image = var.vault-image
                }
        }
        network_interface {
                subnetwork = google_compute_subnetwork.vault_subnet.self_link	
        }

	service_account {
		email  = google_service_account.vault_kms_service_account.email
		scopes = ["cloud-platform", "compute-rw", "userinfo-email", "storage-ro"]
  	  }

        depends_on = [  google_compute_subnetwork.vault_subnet,
			google_compute_instance.consul_1,
			google_compute_instance.consul_2,
			google_compute_instance.consul_3,
			]
}

