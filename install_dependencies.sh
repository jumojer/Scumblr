gem install rake
gem install bundler --no-ri --no-rdoc
rbenv rehash
gem install rails -v 4.0.9
gem install sidekiq
rbenv rehash
bundle install
rake db:create
rake db:schema:load