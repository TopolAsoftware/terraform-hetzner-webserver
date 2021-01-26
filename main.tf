########################################################################
###
### terraform-hetzner-webserver script
### 2021 (c) Oleg Vlasenko, MIT License
###
########################################################################
### Required Providers declaration
###
### Actually we don't need providers at parent module,
### but we declare it here to configure access to modules
########################################################################
terraform {
  required_providers {
    hcloud     = { source = "hetznercloud/hcloud" }
    hetznerdns = { source = "timohirt/hetznerdns" }
  }
}


# Configure the Hetzner Cloud and DNS Providers
provider "hetznerdns" { apitoken = var.hetznerdns_token }
provider "hcloud"     { token    = var.hcloud_token }


########################################################################
### 1. Create ns record A type
module "ns-record" {
  source = "./hetzner-dns"

  hdns_domain = var.topola_domain
  hdns_ipv4   = module.web-server.hcloud_ipv4
}
########################################################################
### 2. Add to Hetzner working ssh pulic key
module "ssh-key" {
  source                     = "./hetzner-ssh"

  hcloud_ssh_public_key_file = var.topola_ssh_file
  hcloud_ssh_public_key      = var.topola_ssh_key
}

########################################################################
### 3. Prepare user data for the cloud-init util
module "topola-user-data" {
  source          = "./topola-userdata"
  
  topola_ssh_key  = module.ssh-key.hcloud_ssh_key
  topola_zone_id  = module.ns-record.hdns_zone_id

  ### Optional variables
  topola_user     = var.topola_user
  topola_homedir  = var.topola_homedir
  
  ### Required variables
  topola_domain   = var.topola_domain
}
########################################################################
### 4. Create instance - Hetzner cloud VPS
module "web-server" {
  source = "./hetzner-vps"

  ### Default values
  hcloud_server_name  = var.topola_server_name
  hcloud_server_image = var.topola_server_image
  hcloud_server_type  = var.topola_server_type

  ### Optional values
  hcloud_datacenter = var.topola_datacenter

  ### Required variables
  hcloud_ssh_key   = module.ssh-key.hcloud_ssh_key_id
  hcloud_userdata  = module.topola-user-data.topola_userdata
}

### Final
########################################################################
