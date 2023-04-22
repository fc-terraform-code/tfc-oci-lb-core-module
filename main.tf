#--GitHub Actions & Terraform Cloud config
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "= 4.101.0"
    }
  }
  cloud {
    organization = var.organization

    workspaces {
      name = var.name
    }
  }
}

resource "oci_load_balancer_load_balancer" "this" {
  #count          = var.lb_options == null ? 0 : length(var.lb_options) > 0 ? 1 : 0
  compartment_id = var.compartment_id
  display_name   = var.display_name
  shape          = "flexible"
  shape_details {
    maximum_bandwidth_in_mbps = 10
    minimum_bandwidth_in_mbps = 10
  }
  # can't really provide a default value here, so no need for additional logic (subnets must be user-defined)
  subnet_ids                 = ["ocid1.subnet.oc1.iad.aaaaaaaat3oydi7ftmagvevgzxczhhpbhtqp3ytadnv2l3uelckxnjsgjm2q"]
  is_private                 = true
  #network_security_group_ids = var.lb_options.nsg_ids != null ? var.lb_options.nsg_ids : local.lb_options_defaults.nsg_ids
  #defined_tags               = var.lb_options.defined_tags != null ? var.lb_options.defined_tags : local.lb_options_defaults.defined_tags
  #freeform_tags              = var.lb_options.freeform_tags != null ? var.lb_options.freeform_tags : local.lb_options_defaults.freeform_tags
}
