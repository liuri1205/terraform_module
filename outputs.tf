output "db_id" {
  value = alicloud_mongodb_instance.default.*.id
}