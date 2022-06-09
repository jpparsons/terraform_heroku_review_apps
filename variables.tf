

variable "personal" {
  description = "Specify if this app should be created in your personal space"
  type        = bool
  default     = true
}

variable "heroku_app_buildpacks" {
  type = list(any)
}

variable "heroku_stack" {
  description = "The Heroku dyno stack, like heroku-18"
}

variable "test_app_name" {
  description = "The app name"
}

variable "config_vars" {
  type = map(any)

  description = "Environment variables"
}

variable "pipeline_id" {
  description = "The pipeline id"
}


variable "heroku_postgresql" {
  description = "Heroku postgresql type"
}

variable "rediscloud" {
  description = "Rediscloud addon"
}

variable "elasticsearch" {
  description = "Elasticsearch addon"
}

variable "heroku_scheduler" {
  description = "Scheduler addon"
}

variable "web_size" {
  description = "Rails web Size, e.g., hobby"
}

variable "worker_size" {
  description = "Rails worker Size, e.g., hobby"
}

variable "sensitive_config_vars" {}

variable "heroku_team" {}
