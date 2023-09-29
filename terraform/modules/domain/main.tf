resource "libvirt_domain" "okd_bootstrap" {
  name            = var.bootstrap.name
  description     = var.bootstrap.description
  vcpu            = var.bootstrap.vcpu
  memory          = var.bootstrap.memory * 1024 # MiB
  running         = true
  coreos_ignition = var.bootstrap_ignition_id

  disk {
    volume_id = var.bootstrap_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = var.bootstrap.name
    addresses      = [var.bootstrap.address]
    mac            = var.bootstrap.mac
    wait_for_lease = true
  }
}

resource "libvirt_domain" "okd_controlplane_1" {
  name            = var.controlplane_1.name
  description     = var.controlplane_1.description
  vcpu            = var.controlplane_1.vcpu
  memory          = var.controlplane_1.memory * 1024 # MiB
  running         = true
  coreos_ignition = var.master_ignition_id

  disk {
    volume_id = var.controlplane_1_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = var.controlplane_1.name
    addresses      = [var.controlplane_1.address]
    mac            = var.controlplane_1.mac
    wait_for_lease = true
  }
}
resource "libvirt_domain" "okd_controlplane_2" {
  name            = var.controlplane_2.name
  description     = var.controlplane_2.description
  vcpu            = var.controlplane_2.vcpu
  memory          = var.controlplane_2.memory * 1024 # MiB
  running         = true
  coreos_ignition = var.master_ignition_id

  disk {
    volume_id = var.controlplane_2_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = var.controlplane_2.name
    addresses      = [var.controlplane_2.address]
    mac            = var.controlplane_2.mac
    wait_for_lease = true
  }
}
resource "libvirt_domain" "okd_controlplane_3" {
  name            = var.controlplane_3.name
  description     = var.controlplane_3.description
  vcpu            = var.controlplane_3.vcpu
  memory          = var.controlplane_3.memory * 1024 # MiB
  running         = true
  coreos_ignition = var.master_ignition_id

  disk {
    volume_id = var.controlplane_3_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = var.controlplane_3.name
    addresses      = [var.controlplane_3.address]
    mac            = var.controlplane_3.mac
    wait_for_lease = true
  }
}
