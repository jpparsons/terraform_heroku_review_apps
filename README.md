# terraform_heroku_review_apps
Basic framework to create Rails app in Heroku while the review apps were paused due to a Heroku incident.
## Sample dev.tfvars

```
test_app_name = "test-app"

heroku_app_buildpacks = [
  "heroku/nodejs",
  "heroku/ruby",
  "https://github.com/Lostmyname/heroku-buildpack-post-build-clean.git",
  "https://github.com/heroku/heroku-buildpack-nginx",
  "https://github.com/niteoweb/heroku-buildpack-shell"
]

pipeline_id = "ID"

heroku_postgresql = "heroku-postgresql:hobby-dev"

rediscloud = "rediscloud:30"

elasticsearch = "bonsai:sandbox-6"

heroku_scheduler = "scheduler:standard"

heroku_team = "productplan"

# Heroku personal space is default
personal = true

web_size = "hobby"
```
