variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "private_key" {}

variable "region" {}

variable "fingerprint" {}

variable "compartment_ocid" { type = string }

variable "organization" {
  type    = string
  default = ""
}

variable "name" {
  type    = string
  default = ""
}

variable "display_name" {
  type    = string
  default = ""
}
