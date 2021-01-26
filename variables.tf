

variable "hcloud_token" {}
variable "hetznerdns_token" {}

variable "topola_ssh_file" {
    description = "File with SSH Public key to access at server"
}

variable "topola_ssh_key" {
    description = "SSH Public key, if null - use file in var above"
    default     = null
}

variable "topola_server_name"  {
   default = "hcloud-terraform"
}

variable "topola_server_image" {
   default = "debian-10"
}

variable "topola_server_type"  {
   default = "cx11"
}

variable "topola_datacenter" {
    description = "Netzner Data Center you prefer or need"
}

variable "topola_user" {}
variable "topola_homedir" {}
variable "topola_domain" {}
