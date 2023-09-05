resource "libvirt_domain" "okd_svc" {
  name            = "okd_svc"
  description     = "okd service vm"
  vcpu            = 1
  memory          = 7629 # MiB
  running         = true
  coreos_ignition = var.okd_svc_ignition_id

  disk {
    volume_id = var.okd_svc_volume_id
    scsi      = false
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    network_id     = var.network_id
    hostname       = "okd_svc"
    addresses      = ["192.168.150.2"]
    mac            = "AA:BB:CC:11:22:22"
    wait_for_lease = true
  }
}
