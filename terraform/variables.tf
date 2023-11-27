variable "coreos_image" {
  type        = string
  default     = "../coreos/fedora-coreos-39.20231101.3.0-qemu.x86_64.qcow2"
  description = "CoreOS image to use"
}

variable "bootstrap" {
  type = map(string)
  default = {
    name        = "okd-bootstrap"
    description = "okd bootstrap vm"
    vcpu        = 4
    memory      = 16  # GiB
    volume_size = 150 # GiB
    address     = "192.168.150.3"
    mac         = "AA:BB:CC:10:00:00"
  }
}

variable "controlplane_1" {
  type = map(string)
  default = {
    name        = "okd-controlplane-1"
    description = "okd controlplane 1 vm"
    vcpu        = 4
    memory      = 16  # GiB
    volume_size = 150 # GiB
    address     = "192.168.150.10"
    mac         = "AA:BB:CC:20:00:00"
  }
}

variable "controlplane_2" {
  type = map(string)
  default = {
    name        = "okd-controlplane-2"
    description = "okd controlplane 2 vm"
    vcpu        = 4
    memory      = 16  # GiB
    volume_size = 150 # GiB
    address     = "192.168.150.11"
    mac         = "AA:BB:CC:20:00:01"
  }
}

variable "controlplane_3" {
  type = map(string)
  default = {
    name        = "okd-controlplane-3"
    description = "okd controlplane 3 vm"
    vcpu        = 4
    memory      = 16  # GiB
    volume_size = 150 # GiB
    address     = "192.168.150.12"
    mac         = "AA:BB:CC:20:00:02"
  }
}
