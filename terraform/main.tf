module "network" {
  source         = "./modules/network"
  bootstrap      = var.bootstrap
  controlplane_1 = var.controlplane_1
  controlplane_2 = var.controlplane_2
  controlplane_3 = var.controlplane_3
}

module "volumes" {
  source                   = "./modules/volumes"
  coreos_image             = var.coreos_image
  bootstrap_volume_size    = var.bootstrap.disk_size
  controlplane_volume_size = var.controlplane_1.disk_size # TODO: should I split it per controlplane or keep all the nodes the same size?
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
  okd_controlplane_2_volume_id = module.volumes.okd_controlplane_2_volume.id
  okd_controlplane_3_volume_id = module.volumes.okd_controlplane_3_volume.id
  okd_master_ignition_id       = module.ignition.okd_master_ignition.id

  bootstrap      = var.bootstrap
  controlplane_1 = var.controlplane_1
  controlplane_2 = var.controlplane_2
  controlplane_3 = var.controlplane_3

  # depends_on = [
  #   module.network,
  #   module.volumes
  # ]
}

