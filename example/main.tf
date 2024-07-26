terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

provider "ncloud" {}

resource "ncloud_vpc" "vpc" {
   ipv4_cidr_block = "10.0.0.0/16"
}

module "network_acl_deny_allow_group" {
  source      = "../"
  vpc_no      = ncloud_vpc.vpc.id
  name        = "sample-network-acl"
  description = "This is a sample ACL deny/allow group"
  ip_list     = ["10.0.0.1", "10.0.0.2"]
}