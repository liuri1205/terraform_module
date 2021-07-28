# 在一个Region 下创建一个 VPC, 并且在每个 Zone 中创建一个 VSwitch
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/network"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

resource "alicloud_vswitch" "default" {
  count        = length(data.alicloud_zones.default.ids)
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 4, count.index + 1)
  zone_id      = data.alicloud_zones.default.ids[count.index]
  vswitch_name = format("%s-%s", var.vswitch_name_prefix, data.alicloud_zones.default.ids[count.index])
}