module "my_network" {
  source = "../"
  region = "cn-hangzhou"

  vpc_name            = "tf-testacctest1204"
  vswitch_name_prefix = "tf-testacc02351"

}

//resource "alicloud_mongodb_instance" "default" {
//  name = "tf-testaccmdtest"
//  db_instance_class = "dds.mongo.mid"
//  db_instance_storage = 10
//  engine_version = "3.4"
//  vswitch_id = module.my_network.vswitch_ids.0
//}
