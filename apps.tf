
resource "heroku_app" "review_app" {

  name   = var.test_app_name
  region = "us"
  stack  = var.heroku_stack

  sensitive_config_vars = var.sensitive_config_vars

  buildpacks = var.heroku_app_buildpacks

  organization {
    name     = var.heroku_team
    locked   = false
    personal = var.personal ? true : false
  }
}

resource "heroku_pipeline_coupling" "reviewapp" {
  app_id   = heroku_app.review_app.id
  pipeline = var.pipeline_id
  stage    = var.app_stage

  depends_on = [heroku_app.review_app]
}

resource "heroku_build" "review_app" {
  app_id = heroku_app.review_app.id

  source {
    # A local directory in this project, changing its contents will
    # force a new build during `terraform apply`
    path = var.source_dir
  }

  depends_on = [heroku_app.review_app]
}

resource "heroku_app_release" "reviewapp-release" {
  app_id  = heroku_app.review_app.id
  slug_id = heroku_build.review_app.slug_id

  depends_on = [heroku_build.review_app]
}

resource "heroku_formation" "review_app_web" {
  app_id   = heroku_app.review_app.id
  type     = "web"
  quantity = 1
  size     = var.web_size

  depends_on = [heroku_app_release.reviewapp-release]
}

resource "heroku_formation" "review_app_worker" {
  app_id   = heroku_app.review_app.id
  type     = "worker"
  quantity = 1
  size     = var.worker_size

  depends_on = [heroku_app_release.reviewapp-release]
}


# Run an app specific rake task to initialize the database
resource "null_resource" "initdb" {
  # only run if new app
  triggers = {
    this_app = heroku_app.review_app.uuid
  }

  provisioner "local-exec" {
    command = "heroku run bundle exec rails 'pp:initdb' -a ${var.test_app_name}"
  }

  depends_on = [heroku_formation.review_app_worker]
}

output "review_app_url" {
  value = "https://${var.test_app_name}.herokuapp.com"
}

output "heroku_app_url" {
  value = "https://dashboard.heroku.com/apps/${var.test_app_name}"
}
