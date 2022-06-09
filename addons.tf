

resource "heroku_addon" "database" {

  app_id = heroku_app.test_app.id
  plan   = var.heroku_postgresql

  depends_on = [heroku_app.test_app]
}

resource "heroku_addon" "redis" {

  app_id = heroku_app.test_app.id
  plan   = var.rediscloud

  depends_on = [heroku_app.test_app]
}

resource "heroku_addon" "elasticsearch" {

  app_id = heroku_app.test_app.id
  plan   = var.elasticsearch

  depends_on = [heroku_app.test_app]
}

resource "heroku_addon" "heroku_scheduler" {

  app_id = heroku_app.test_app.id
  plan   = var.heroku_scheduler

  depends_on = [heroku_app.test_app]
}
