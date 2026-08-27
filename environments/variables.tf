variable "location" {
  description = "The Azure location where Speculative capacity is established."
  type        = string
  default     = "centralus"
}

variable "s_s_environment_capacity" {
  description = "The declared number of speculative environments for the strata artifact."
  type        = number
  default     = 2

  validation {
    condition     = var.s_s_environment_capacity >= 0
    error_message = "Speculative environments for the strata artifact capacity must be zero or greater."
  }
}

variable "s_k_environment_capacity" {
  description = "The declared number of speculative environments for the kitting artifact."
  type        = number
  default     = 2

  validation {
    condition     = var.s_k_environment_capacity >= 0
    error_message = "Speculative environments for the kitting artifact capacity must be zero or greater."
  }
}