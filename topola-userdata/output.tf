
output "topola_userdata" {
   value = data.cloudinit_config.topola_userdata.rendered
}
