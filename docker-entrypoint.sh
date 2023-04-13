#!/bin/bash
rm -f tmp/pids/server.pid
bundle install --path=vendor/cache

echo "Starting rails server"
bundle exec rails server -p 3000 -b 0.0.0.0 -e $RAILS_ENV
