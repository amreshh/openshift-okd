resource "libvirt_ignition" "okd_bootstrap" {
  name    = "okd_bootstrap.ign"
  pool    = "default"
  content = "../ignition_configs/bootstrap.ign"
}

resource "libvirt_ignition" "okd_master" {
  name    = "okd_master.ign"
  pool    = "default"
  content = "../ignition_configs/master.ign"
}
