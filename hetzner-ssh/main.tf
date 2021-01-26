########################################################################
### terraform requires declaration of required providers in each module
###
terraform {
  required_providers {
    hcloud = {
           source  = "hetznercloud/hcloud"
    }
   }
 }



## Install new ssh public key at Hetzner Cloud Console
resource hcloud_ssh_key "ssh_key" {
    name       = var.hcloud_ssh_public_key_name
    public_key = var.hcloud_ssh_public_key != null ? var.hcloud_ssh_public_key : file(var.hcloud_ssh_public_key_file)
}

## Get existing ssh public key from the Hetzner Project
# data "hcloud_ssh_key" "ssh_key" {
#   name = var.hcloud_ssh_public_key_name
# }

