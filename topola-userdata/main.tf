
data "cloudinit_config" "topola_userdata" {

  gzip          = true
  base64_encode = true

  part {
    filename     = "topola.yaml"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/user-data/topola.yaml",
                      {
                          topola_user       = var.topola_user
                          topola_homedir    = var.topola_homedir
                          topola_public_key = var.topola_ssh_key
                          topola_domain     = var.topola_domain
                          topola_zone_id    = var.topola_zone_id
                      })
  }

  part {
    filename     = "10_webcert.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/user-data/10_webcert.sh")
  }

  part {
    filename     = "70_webapp.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/user-data/70_webapp.sh")
  }
  
}
