module "rg" {
  source = "./modules/resource_group"
  name   = var.resource_group_name
}

module "vpc" {
  source = "./modules/vpc"
  name   = "demo-vpc"
}

module "subnet" {
  source = "./modules/subnet"
  name   = "demo-subnet"
  vpc_id = module.vpc.vpc_id
  zone   = var.zone
}

module "linux_vsi" {
  source             = "./modules/compute_linux"
  name               = var.linux_instance_name
  resource_group_id  = module.rg.resource_group_id
  profile            = "bx2-2x8"
  zone               = var.zone
  image              = "ibm-ubuntu-22-04-3-minimal-amd64-1"
  ssh_key_id         = var.ssh_key_id
  subnet_id          = module.subnet.subnet_id
}

module "windows_vsi" {
  source             = "./modules/compute_windows"
  name               = var.windows_instance_name
  resource_group_id  = module.rg.resource_group_id
  profile            = "bx2-2x8"
  zone               = var.zone
  image              = "ibm-windows-server-2022-datacenter-amd64"
  ssh_key_id         = var.ssh_key_id
  subnet_id          = module.subnet.subnet_id
}