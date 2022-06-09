terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 0.13"
}
