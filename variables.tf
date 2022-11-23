variable "instance_type" {
  description = "The instance type to use"
  type        = string
}

variable "memory_for_app_pct" {
  description = "The percent of the instance memory to allocate to the application"
  type        = number
  default     = 80
}

variable "memory_for_os_mb" {
  description = "The minimum amount of memory that must be available for the base Operation System"
  type        = number
  default     = 384
}
