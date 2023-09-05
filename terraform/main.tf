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
  source              = "./modules/domain"
  okd_svc_volume_id   = module.volumes.okd_svc_volume.id
  network_id          = module.network.okd_network.id
  okd_svc_ignition_id = module.ignition.okd_svc_ignition.id

  # depends_on = [
  #   module.network,
  #   module.volumes
  # ]
}

