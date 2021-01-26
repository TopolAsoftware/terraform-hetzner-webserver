
variable "hcloud_server_name" {
   description = "Project name of web server (optional)"
   default = "hcloud-terraform"
}

variable "hcloud_server_image" {
   description = "OS image (optional)"
   default = "debian-10"
}

variable "hcloud_server_type" {
   description = "HCloud plan (optional)"
   default = "cx11"
}

variable "hcloud_datacenter" {
   description = "Hetzner Data Center (optional)"
   default = "nbg1-dc3"
}

variable "hcloud_ssh_key" {
   description = "SSH public key for root user (required)"
}

variable "hcloud_userdata" {
   description = "cloud-init user data block (required)"
}

