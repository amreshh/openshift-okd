variable "network_id" {
  type        = string
  description = "value of network_id"
}

variable "okd_bootstrap_volume_id" {
  type        = string
  description = "value of okd_bootstrap_volume_id"
}

variable "okd_bootstrap_ignition_id" {
  type        = string
  description = "value of okd_bootstrap_ignition_id"
}

variable "okd_controlplane_1_volume_id" {
  type        = string
  description = "value of okd_controlplane_1_volume_id"
}

variable "okd_controlplane_2_volume_id" {
  type        = string
  description = "value of okd_controlplane_2_volume_id"
}

variable "okd_controlplane_3_volume_id" {
  type        = string
  description = "value of okd_controlplane_3_volume_id"
}

variable "okd_master_ignition_id" {
  type        = string
  description = "value of okd_master_ignition_id"
}

variable "bootstrap" {
  type = map(string)
}

variable "controlplane_1" {
  type = map(string)
}

variable "controlplane_2" {
  type = map(string)
}

variable "controlplane_3" {
  type = map(string)
}
