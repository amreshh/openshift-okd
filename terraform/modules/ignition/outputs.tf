output "bootstrap_ignition" {
  value = libvirt_ignition.bootstrap_ignition
}

output "master_ignition" {
  value = libvirt_ignition.master_ignition
}
