output "v_cpu_count" {
  description = "The number of vCPUs allocated to this instance"
  value       = data.aws_ec2_instance_type.type.default_vcpus
}

output "memory_mb" {
  description = "The amount of memory in mb allocated to this instance"
  value       = local.memory_mb
}

output "memory_application_mb" {
  description = "The recommended memory to allocate to an application running on this instance"
  value       = local.memory_application_mb
}

output "memory_application_mb_max" {
  description = "The maximum memory to allocate to an application running on this instance"
  value       = local.memory_application_mb_max
}
