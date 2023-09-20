module "network" {
  source = "./modules/network"
}

module "volumes" {
  source = "./modules/volumes"
}

module "ignition" {
  source = "./modules/ignition"
}

module "domain" {
  source                       = "./modules/domain"
  network_id                   = module.network.okd_network.id
  okd_bootstrap_volume_id      = module.volumes.okd_bootstrap_volume.id
  okd_bootstrap_ignition_id    = module.ignition.okd_bootstrap_ignition.id
  okd_controlplane_1_volume_id = module.volumes.okd_controlplane_1_volume.id
  okd_master_ignition_id       = module.ignition.okd_master_ignition.id

  # depends_on = [
  #   module.network,
  #   module.volumes
  # ]
}

