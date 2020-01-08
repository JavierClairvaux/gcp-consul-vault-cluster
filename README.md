#gcp-consul-vault-cluster

Terraform scripts to set up a consul-vault cluster on GCP, meant to work with Google images made with packer:
	1.javier-claivaux/gcp-consul-image 
	2.javier-claivaux/gcp-consul-vault-kms-image 

Run the next command to unseal vault:

```console
$ vault operator init -recovery-shares=1 -recovery-threshold=1
```
