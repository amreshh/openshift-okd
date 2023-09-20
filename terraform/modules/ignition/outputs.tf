output "okd_bootstrap_ignition" {
  value = libvirt_ignition.okd_bootstrap
}

output "okd_master_ignition" {
  value = libvirt_ignition.okd_master
}
