########################################################################
### terraform requires declaration of required providers in each module
###
terraform {
  required_providers {
    hetznerdns = { 
          source  = "timohirt/hetznerdns" 
    }
  }
}

########################################################################
data "hetznerdns_zone" "hdns_zone" {
  name = var.hdns_domain
}

########################################################################
#
resource "hetznerdns_record" "hdns_arecord" {
  zone_id = data.hetznerdns_zone.hdns_zone.id
  value   = var.hdns_ipv4
  name    = "@"
  type    = "A"
}

########################################################################
