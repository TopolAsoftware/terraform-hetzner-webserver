#
# Template for cloud-init user data
#

variable "topola_user" {
    description = "TopolA MS user login == WebAdmin"
    default     = "topola"
}

variable "topola_homedir" {
    description = "TopolA MS homedir (WebHome)"
    default     = "/opt/topola"
}

variable "topola_ssh_key" {
    description = "Public key for TopolA accnt user (not root)"
}

variable "topola_domain" {
    description = "Domain for web-server access"
}

### May be usefull for user-data block to DNS acme procedure
variable "topola_zone_id" {
    description = "Zone ID at DNS Prvider"
}


