module "oci_lb" {  
  default_compartment_id  = var.default_compartment_ocid
  
  lb_options            = {
    display_name        = "test_lb"
    compartment_id      = null
    shape               = "10Mbps"
    subnet_ids          = [oci_core_subnet.this.id]
    private             = true
    nsg_ids             = null
    defined_tags        = null
    freeform_tags       = null
  }
}

resource "oci_core_vcn" "this" {
  dns_label             = "temp"
  cidr_block            = "192.168.0.0/16"
  compartment_id        = var.compartment_id
  display_name          = "temp"
}

resource "oci_core_subnet" "this" {
  cidr_block            = "192.168.0.0/24"
  compartment_id        = var.compartment_id
  vcn_id                = oci_core_vcn.this.id

  display_name          = "test"
  dns_label             = "test"
  prohibit_public_ip_on_vnic = false
}
