output "okd_bootstrap_volume" {
  value = libvirt_volume.okd_bootstrap
}

output "okd_controlplane_1_volume" {
  value = libvirt_volume.okd_controlplane_1
}

output "okd_controlplane_2_volume" {
  value = libvirt_volume.okd_controlplane_2
}

output "okd_controlplane_3_volume" {
  value = libvirt_volume.okd_controlplane_3
}
