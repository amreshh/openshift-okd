resource "libvirt_domain" "okd_bootstrap" {
  name            = "okd-bootstrap"
  description     = "okd bootstrap vm"
  vcpu            = 4
  memory          = 15260 # MiB
  running         = true
  coreos_ignition = var.okd_bootstrap_ignition_id

  disk {
    volume_id = var.okd_bootstrap_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = "okd-bootstrap"
    addresses      = ["192.168.150.3"]
    mac            = "AA:BB:CC:10:00:01"
    wait_for_lease = true
  }
}

resource "libvirt_domain" "okd_controlplane_1" {
  name            = "okd-controlplane-1"
  description     = "okd controlplane 1 vm"
  vcpu            = 4
  memory          = 15260 # MiB
  running         = true
  coreos_ignition = var.okd_master_ignition_id

  disk {
    volume_id = var.okd_controlplane_1_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = "okd-controlplane-1"
    addresses      = ["192.168.150.10"]
    mac            = "AA:BB:CC:20:00:00"
    wait_for_lease = true
  }
}
