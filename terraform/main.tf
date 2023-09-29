module "network" {
  source         = "./modules/network"
  bootstrap      = var.bootstrap
  controlplane_1 = var.controlplane_1
  controlplane_2 = var.controlplane_2
  controlplane_3 = var.controlplane_3
}

module "volumes" {
  source                     = "./modules/volumes"
  coreos_image               = var.coreos_image
  bootstrap_volume_size      = var.bootstrap.volume_size
  controlplane_1_volume_size = var.controlplane_1.volume_size
  controlplane_2_volume_size = var.controlplane_2.volume_size
  controlplane_3_volume_size = var.controlplane_3.volume_size
}

module "ignition" {
  source = "./modules/ignition"
}

module "domain" {
  source     = "./modules/domain"
  network_id = module.network.okd_network.id

  bootstrap_volume_id   = module.volumes.bootstrap_volume.id
  bootstrap_ignition_id = module.ignition.bootstrap_ignition.id

  controlplane_1_volume_id = module.volumes.controlplane_1_volume.id
  controlplane_2_volume_id = module.volumes.controlplane_2_volume.id
  controlplane_3_volume_id = module.volumes.controlplane_3_volume.id
  master_ignition_id       = module.ignition.master_ignition.id

  bootstrap      = var.bootstrap
  controlplane_1 = var.controlplane_1
  controlplane_2 = var.controlplane_2
  controlplane_3 = var.controlplane_3

  # depends_on = [
  #   module.network,
  #   module.volumes
  # ]
}

