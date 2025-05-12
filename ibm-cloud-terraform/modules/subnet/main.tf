resource "ibm_is_subnet" "subnet" {
  name = var.name
  vpc  = var.vpc_id
  zone = var.zone
  ipv4_cidr_block = "10.10.10.0/24"
}