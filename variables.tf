variable "credentials_path" {
	description = "Path to credentials"
	default = $PATH_TO_CREDENTIALS 
}

variable "gcp_region" {
	description = "GCP region for consul-vault cluster"
	default = $GCP_REGION
}

variable "gcp_zone" {
	description = "GCP zone for consul-vault cluster"
	default = $GCP_REGION

}

variable "gcp_project" {
	description = "GCP project"
	default = $GCP_PROJECT
}

variable "consul-server-type" {
	description = "consul server machine type"
	default = $CONSUL_MACHINE_TYPE
}

variable "consul-server-image" {
	description = "consul server image"
	default = $CONSUL_IMAGE 
}

variable "ssh-user" {
	description = "user to get ssh access into instance"
	default = $SSH_USER
}

variable "ssh-key" {
	description = "ssh key path for consul servers"
	default = $PATH_TO_SSH_KEY
}

variable "my_public_ip" {
	description = "ssh key path for consul servers"
	default = $PUBLIC_IP
}

variable "vault_ip_cidr" {
	description = "Internal IP range for vault-consul cluster"
	default = $VAULT_CIDR
}

variable "internal_consul_ip_1" {
	description = "Internal static ip for consul server 1"
	default = $CONSUL_INT_IP_1
}


variable "internal_consul_ip_2" {
	description = "Internal static ip for consul server 2"
	default = $CONSUL_INT_IP_2
}


variable "internal_consul_ip_3" {
	description = "Internal static ip for consul server 3"
	default = $CONSUL_INT_IP_3
}


variable "node_name_1" {
	description = "Consul node name for consul server 1"
	default = $NODE_NAME_1
}

variable "node_name_2" {
	description = "Consul node name for consul server 2"
	default = $NODE_NAME_2
}

variable "node_name_3" {
	description = "Consul node name for consul server 3"
	default = $NODE_NAME_3
}

variable "consul_dc" {
	description = "consul datacenter"
	default = $CONSUL_DC
}

variable "encrytp_key" {
	description = "Consul gossip encrytion key"
	default = $ENCRYPT_KEY
}

variable "vault-image" {
	description = "vault server image"
	default = $VAULT_IMAGE 
}

variable "vault-server-type" {
	description = "vault server machine type"
	default = $VAULT_SERVER_TYPE
}

variable "vault_name_1" {
	description = "Consul node name for consul server 3"
	default = $VAULT_NODE_NAME_1
}

variable "vault_name_2" {
	description = "Consul node name for consul server 3"
	default = $VAULT_NODE_NAME_2
} 

variable "key_ring" {
	description = "Keyring name"
	default = $KEYRING_NAME
}

variable "key_ring_location" {
	description = "Keyring location"
	default = $KEYRING_LOCATION
}

variable "crypto_key" {
	description = "KMS key name"
	default = $CRYPTO_KEY
}
