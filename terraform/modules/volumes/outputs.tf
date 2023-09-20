output "okd_bootstrap_volume" {
  value = libvirt_volume.okd_bootstrap
}

output "okd_controlplane_1_volume" {
  value = libvirt_volume.okd_controlplane_1
}
