data "aws_ec2_instance_type" "type" {
  instance_type = var.instance_type
}

locals {
  memory_mb = data.aws_ec2_instance_type.type.memory_size

  # The maximal allocation of memory given the OS memory constraint
  memory_application_mb_max = local.memory_mb - var.memory_for_os_mb
  # The maximal allocation of memory based on the application pct
  memory_application_mb_calc = (var.memory_for_app_pct * local.memory_mb) / 100
  # The expected memory leftover for the OS
  memory_os_mb_calc = local.memory_mb - local.memory_application_mb_calc

  # If the application pct would leave LESS than the required OS memory then 
  # we take the remaining memory after OS memory is apportioned.  This protects against
  # situations where we use very small servers like 't3.nano'.
  #
  # Otherwise we take the percentage of the box as indicated.
  memory_application_mb = (
    local.memory_os_mb_calc < var.memory_for_os_mb ?
    local.memory_application_mb_max : local.memory_application_mb_calc
  )
}
