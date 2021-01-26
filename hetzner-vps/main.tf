########################################################################
###
###
###
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
########################################################################
### Create Hetzner Cloud VPS
###
resource "hcloud_server" "web-server" {
  name        = var.hcloud_server_name
  image       = var.hcloud_server_image
  server_type = var.hcloud_server_type
  datacenter  = var.hcloud_datacenter
  user_data   = var.hcloud_userdata
  ssh_keys    = [var.hcloud_ssh_key]
}

########################################################################
