variable "reservation" {
  type        = string
  description = "The pubsub_lite_reservation name"
  default     = "suri-rese1"
}
variable "project_id" {
  type        = string
  description = " The ID of the project in which the resource belongs"
  default     = "sailor-321711"
}
variable "topic" {
  type        = string
  description = "The pubsub_lite topic name"
  default     = "surya-top1"
}
variable "region" {
  type        = string
  description = "name of the region"
  default     = "asia-south1"
}
variable "zone" {
  type        = string
  description = "name of the zone"
  default     = "asia-south1-a"
}

variable "subscription" {
  type        = string
  description = "name of the subscription"
  default     = "sur-subs1"
}
variable "throughput_capacity" {
  type        = number
  description = "The reserved throughput capacity. Every unit of throughput capacity is equivalent to 1 MiB/s of published messages or 2 MiB/s of subscribed messages."
  default     = 3
}
variable "delivery_requirement" {
  type = list(object({
    delivery_requirement = string
  }))
  description = "When this subscription should send messages to subscribers relative to messages persistence in storage. Possible values are DELIVER_IMMEDIATELY, DELIVER_AFTER_STORED, and DELIVERY_REQUIREMENT_UNSPECIFIED"
  default = [{
    delivery_requirement = "DELIVER_IMMEDIATELY"
  }]
}
variable "per_partition_bytes" {
  type = list(object({
    per_partition_bytes = number
  }))
  description = "The provisioned storage, in bytes, per partition"
  default = [{
    per_partition_bytes = 32212254720
  }]
}
variable "partition_config_count" {
  type = map(object({
    partition_config_count = number
    capacity = object({
      publish_mib_per_sec   = number
      subscribe_mib_per_sec = number
    })
  }))
  description = "The number of partitions in the topic. Must be at least 1"
  default = {
    "key" = {
      capacity = {
        publish_mib_per_sec   = 4194304
        subscribe_mib_per_sec = 4194304
      }
      partition_config_count = 3
    }
  }
}
