module "db_test" {
  source = "../"

  db_name_prefix = "tf-testacc"

  //  db_configs = [
  //    {
  //      name = "db1"
  //      storage = "10"
  //      class = "dds.mongo.mid"
  //      engine_version = "3.4"
  //    },
  //    {
  //      name = "db2"
  //      storage = "20"
  //      class = "dds.mongo.mid"
  //      engine_version = "3.4"
  //    },
  //    {
  //      name = "db3"
  //      storage = "30"
  //      class = "dds.mongo.mid"
  //      engine_version = "3.4"
  //    }
  //  ]
}

output "db_id" {
  value = module.db_test.db_id
}