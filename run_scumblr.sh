redis-server &
bundle exec sidekiq -l log/sidekiq.log &
bundle exec rails s &