# size = convert GiB to Bytes
resource "libvirt_volume" "fedora_coreos" {
  name   = "fedora_coreos.qcow2"
  pool   = "default"
  source = "./coreos/fedora-coreos-38.20230806.3.0-qemu.x86_64.qcow2"
}

resource "libvirt_volume" "okd_svc" {
  name = "okd_svc.qcow2"
  pool = "default"
  size = 161061273600
}

resource "libvirt_volume" "okd_bootstrap" {
  name = "okd_bootstrap.qcow2"
  pool = "default"
  size = 161061273600
}

resource "libvirt_volume" "okd_controlplane_1" {
  name = "okd_controlplane_1.qcow2"
  pool = "default"
  size = 161061273600
}
