variable "coreos_image" {
  type        = string
  description = "CoreOS image to use"
}

variable "bootstrap_volume_size" {
  type        = number
  description = "Size of the bootstrap volume in GiB"
}

variable "controlplane_volume_size" {
  type        = number
  description = "Size of the controlplane volumes in GiB"
}
