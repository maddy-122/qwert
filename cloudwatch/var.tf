variable "member_clusters" {
  type        = list(string)
}

variable "cpu_utilization" {

  type = object({
    alarm_name         = string
    evaluation_periods = number
    period             = number
    threshold          = number
    alarm_actions      = list(string)
  })

  default = {
    alarm_name         = "ElastiCache-CPU-Utilization"
    evaluation_periods = 1
    period             = 300
    threshold          = 80
    alarm_actions      = []
  }
}

variable "monitor_cpu_utilization" {
  type        = bool
  default     = false
}

