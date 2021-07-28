# Provider config
variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#VPC config
variable "vpc_name" {
  description = "The name of vpc"
  type        = string
  default     = "tf-testaccvpctest1234"
}

variable "cidr_block" {
  description = "The name of vpc"
  type        = string
  default     = "172.16.0.0/12"
}

# VSwitch config
variable "vswitch_name_prefix" {
  description = "The vswitch name prefix"
  type        = string
  default     = "tf-testacc"
}

