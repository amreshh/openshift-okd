resource "libvirt_ignition" "okd_svc" {
  name    = "okd_svc.ign"
  pool    = "default"
  content = "./okd_svc.ign"
}
