resource "ibm_is_instance" "windows" {
  name              = var.name
  resource_group    = var.resource_group_id
  profile           = var.profile
  zone              = var.zone
  image             = var.image
  keys              = [var.ssh_key_id]
  primary_network_interface {
    subnet = var.subnet_id
  }
}