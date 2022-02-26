# Configure the Oracle Cloud Infrastructure
#private_key_path = var.private_key_path
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  region = var.region
  private_key_path = var.private_key_path
}

#provider "random" {
#    version = "~> 2.2"
#}

#provider "template" {
#    version = "~> 2.1"
#}

# Create a Compartment
resource "oci_identity_compartment" "versa_compartment" {
    #Required
    compartment_id = var.par_compartment_id
    description = var.compartment_description
    name = var.compartment_name

    #Optional
    freeform_tags = {"Environment"= "Versa FlexVNF"}
    enable_delete = "true"
}

# Create a VCN
resource "oci_core_vcn" "versa_vcn" {
    #Required
    compartment_id = oci_identity_compartment.versa_compartment.compartment_id

    #Optional
    cidr_block = var.vcn_cidr_block
    display_name = var.vcn_display_name
    dns_label = "versavcn"
    #is_ipv6enabled = var.vcn_is_ipv6enabled
}

resource "oci_core_subnet" "mgmt_subnet" {
    #Required
    cidr_block = var.mgmt_cidr_block
    compartment_id = oci_identity_compartment.versa_compartment.compartment_id
    vcn_id = oci_core_vcn.versa_vcn.id

    #Optional
    #availability_domain = var.subnet_availability_domain
    #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
    display_name = "versa-mgmt"
    dns_label = "versamgmt"
    #ipv6cidr_block = var.subnet_ipv6cidr_block
    #prohibit_internet_ingress = var.subnet_prohibit_internet_ingress
    #prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
    #route_table_id = oci_core_route_table.test_route_table.id
    #security_list_ids = var.subnet_security_list_ids
}

resource "oci_core_subnet" "wan_subnet" {
    #Required
    cidr_block = var.wan_cidr_block
    compartment_id = oci_identity_compartment.versa_compartment.compartment_id
    vcn_id = oci_core_vcn.versa_vcn.id

    #Optional
    #availability_domain = var.subnet_availability_domain
    #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
    display_name = "versa-wan"
    dns_label = "versawan"
    #ipv6cidr_block = var.subnet_ipv6cidr_block
    #prohibit_internet_ingress = var.subnet_prohibit_internet_ingress
    #prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
    #route_table_id = oci_core_route_table.test_route_table.id
    #security_list_ids = var.subnet_security_list_ids
}

resource "oci_core_subnet" "lan_subnet" {
    #Required
    cidr_block = var.lan_cidr_block
    compartment_id = oci_identity_compartment.versa_compartment.compartment_id
    vcn_id = oci_core_vcn.versa_vcn.id

    #Optional
    #availability_domain = var.subnet_availability_domain
    #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
    display_name = "versa-lan"
    dns_label = "versalan"
    #ipv6cidr_block = var.subnet_ipv6cidr_block
    #prohibit_internet_ingress = var.subnet_prohibit_internet_ingress
    #prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
    #route_table_id = oci_core_route_table.test_route_table.id
    #security_list_ids = var.subnet_security_list_ids
}
