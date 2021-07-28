# 在指定 Region 下的每个 Zone 中创建一个 mongodb instance.
module "network" {
  source = "./module/network"
  region = var.region

  vpc_name            = var.vpc_name
  vswitch_name_prefix = var.vswitch_name_prefix
}

locals {
  create_dbs = length(var.db_configs) > 0
}

resource "alicloud_mongodb_instance" "default" {
  count               = local.create_dbs ? length(var.db_configs) : length(module.network.vswitch_ids)
  name                = local.create_dbs ? var.db_configs[count.index].name : format("%s_mdtest%d", var.db_name_prefix, count.index)
  db_instance_class   = local.create_dbs ? var.db_configs[count.index].class : var.db_instance_class
  db_instance_storage = local.create_dbs ? var.db_configs[count.index].storage : var.db_instance_storage
  engine_version      = local.create_dbs ? var.db_configs[count.index].engine_version : var.engine_version
  vswitch_id          = module.network.vswitch_ids[count.index]
}
