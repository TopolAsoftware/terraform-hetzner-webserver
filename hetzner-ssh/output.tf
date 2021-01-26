
# ouputs

output "hcloud_ssh_key"      { value = hcloud_ssh_key.ssh_key.public_key }
output "hcloud_ssh_key_id"   { value = hcloud_ssh_key.ssh_key.id }
output "hcloud_ssh_key_name" { value = hcloud_ssh_key.ssh_key.name }
