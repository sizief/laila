#!/bin/bash

if [ "$ENTRYPOINT" = "app" ] && [ "$RAILS_ENV" = "production" ]
then
  rm /usr/src/app/tmp/pids/server.pid
  #yarn install --network-timeout 1000000 --check-files
  #bundle exec rails assets:precompile
  #bundle exec rails webpacker:install
  #bundle exec rake db:migrate
  bundle exec rails s -b 0.0.0.0
elif [ "$ENTRYPOINT" = "app" ] && [ "$RAILS_ENV" = 'development' ]
then
  rm /usr/src/app/tmp/pids/server.pid
  #yarn install --network-timeout 1000000 --check-files
  #bundle exec rails assets:precompile
  #bundle exec rails webpacker:install
  #bundle exec rake db:migrate
  bundle exec rails s -b 0.0.0.0
elif [ "$ENTRYPOINT" = "test" ]
then
  #bundle exec rake db:migrate
  bundle exec rails s
  exit 0
fi
