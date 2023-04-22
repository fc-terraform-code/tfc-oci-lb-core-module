variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key" {}
variable "region" {}
variable "fingerprint" {}
variable "compartment_ocid" { type = string }
variable "organization" {
  type    = string
  default = "tron_dataware"
}
variable "name" {
  type    = string
  default = "lab_tfc_github_lb_oci"
}
variable "display_name" {
  type    = string
  default = "fc-test-lb-2"
}
