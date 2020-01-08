resource "google_compute_instance_group" "consul-servers" {

  name        = "terraform-consul-servers"
  description = "consul servers with terraform and packer"



  instances = [
    google_compute_instance.consul_1.self_link,
    google_compute_instance.consul_2.self_link,
    google_compute_instance.consul_3.self_link,
  ]

  named_port {
    name = "consul_ui"
    port = "8500"
  }

  zone = var.gcp_zone

}

// Consul server instances

resource "google_compute_instance" "consul_1" {
	name         = "consul-server-1"
	machine_type = var.consul-server-type
	zone         = var.gcp_zone
	metadata = {
		sshKeys = "${var.ssh-user}:${file(var.ssh-key)}"
	}
	
	metadata_startup_script = "/home/${var.ssh-user}/provisioner.sh ${var.node_name_1} ${var.consul_dc} ${var.internal_consul_ip_1} ${var.internal_consul_ip_2} ${var.internal_consul_ip_3} ${var.encrytp_key}"	

	boot_disk {
		initialize_params {
			image = var.consul-server-image
		}
	}
	network_interface {
		subnetwork = google_compute_subnetwork.vault_subnet.self_link 
		network_ip = var.internal_consul_ip_1
		access_config { 
			// Include this section to give the VM an external ip address
		}
	}
	depends_on = [ google_compute_subnetwork.vault_subnet ]
}

resource "google_compute_instance" "consul_2" {
	name         = "consul-server-2"
	machine_type = var.consul-server-type
	zone         = var.gcp_zone
	metadata = {
		sshKeys = "${var.ssh-user}:${file(var.ssh-key)}"
	}
	
	metadata_startup_script = "/home/${var.ssh-user}/provisioner.sh ${var.node_name_2} ${var.consul_dc} ${var.internal_consul_ip_2} ${var.internal_consul_ip_3} ${var.internal_consul_ip_1} ${var.encrytp_key}"	

	boot_disk {
		initialize_params {
			image = var.consul-server-image
		}
	}
	network_interface {
		subnetwork = google_compute_subnetwork.vault_subnet.self_link 
		network_ip = var.internal_consul_ip_2
	}
	depends_on = [ google_compute_subnetwork.vault_subnet ]
}


resource "google_compute_instance" "consul_3" {
	name         = "consul-server-3"
	machine_type = var.consul-server-type
	zone         = var.gcp_zone
	metadata = {
		sshKeys = "${var.ssh-user}:${file(var.ssh-key)}"
	}
	
	metadata_startup_script = "/home/${var.ssh-user}/provisioner.sh ${var.node_name_3} ${var.consul_dc} ${var.internal_consul_ip_3} ${var.internal_consul_ip_1} ${var.internal_consul_ip_2} ${var.encrytp_key}"	

	boot_disk {
		initialize_params {
			image = var.consul-server-image
		}
	}
	network_interface {
		subnetwork = google_compute_subnetwork.vault_subnet.self_link 
		network_ip = var.internal_consul_ip_3
	}
	depends_on = [ google_compute_subnetwork.vault_subnet ]
}

