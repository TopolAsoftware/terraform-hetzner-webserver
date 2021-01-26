
variable "hcloud_ssh_public_key_name" {
   description = "Name of public key at Hetzner cloud for WebAdmin"
   default = "hcloud_admin"
}

### Will be used if next var = null
variable "hcloud_ssh_public_key_file" {
   description = "Public key file of Admin"
   default = "~/.ssh/topola/id_topola.pub"
}

### If this variable is "null" use file above
variable "hcloud_ssh_public_key" {
   description = "Public key string of Admin"
   default = null
}

