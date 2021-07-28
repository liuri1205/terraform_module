output "vswitch_ids" {
  description = "A list of vswitch ID."
  value       = alicloud_vswitch.default.*.id
}

output "vpc_id" {
  description = "The ID of VPC."
  value       = alicloud_vpc.default.id
}