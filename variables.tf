// Service / Account
variable "ibmcloud_api_key" {
  description = "API Key"
  type        = string
  default     = "Y5AQcrpScIh8Hf8EtB-YsbADhEF6MVxnTyTnqm6XPyZY"
}
variable "region" {
  description = "Reigon of Service"
  type        = string
  default     = "us-south"
}
variable "zone" {
  description = "Zone of Service"
  type        = string
  default     = "us-south"
}
variable "cloud_instance_id" {
  description = "Cloud Instance ID of Service"
  type        = string
  default     = "fe725bf6-b430-427d-9804-e2d17894542d"
}

// Image
variable "image_name" {
  description = "Name of the image to be used"
  type        = string
  default     = "7300-01-02"
}

// Instance
variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "powervs-terra-2"
}
variable "memory" {
  description = "Instance memory"
  type        = number
  default     = 2
}
variable "processors" {
  description = "Instance processors"
  type        = number
  default     = 0.5
}
variable "proc_type" {
  description = "Instance ProcType"
  type        = string
  default     = "shared"
}
variable "storage_type" {
  description = "The storage type to be used"
  type        = string
  default     = "tier1"
}
variable "sys_type" {
  description = "Instance System Type"
  type        = string
  default     = "s922"
}

// Network
variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "VPNsubnet4"
}
variable "network_type" {
  description = "Type of a network"
  type        = string
  default     = "vlan"
}
variable "network_count" {
  description = "Number of networks to provision"
  type        = number
  default     = 1
}

// Volume
variable "volume_name" {
  description = "Name of the volume"
  type        = string
  default     = "hdisk3"
}
variable "volume_size" {
  description = "Size of a volume"
  type        = number
  default     = 5
}
variable "volume_shareable" {
  description = "Is a volume shareable"
  type        = bool
  default     = false
}
variable "volume_type" {
  description = "Type of a volume"
  type        = string
  default     = "tier1"
}
