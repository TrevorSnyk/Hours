source "https://rubygems.org"

ruby "2.4.2"

gem "airbrake"
gem "apartment"
gem "audited"
gem "aws-sdk"
gem "bitters"
gem "bourbon"
gem "brakeman"
gem "coffee-rails", ">= 4.2.2"
gem "delayed_job_active_record"
gem "devise", "~> 4.7.1"
gem "devise_invitable", ">= 1.7.5"
gem "email_validator"
gem "flutie"
gem "gravatar_image_tag"
gem "haml-rails", ">= 1.0.0"
gem "hashtel", "~> 0.0.2"
gem "high_voltage"
gem "holidays"
gem "http_accept_language"
gem "jquery-atwho-rails", "~> 1.3.2" # autocomplete
gem "jquery-rails", "~> 4.3", ">= 4.3.5"
gem "kaminari"
gem "momentjs-rails", ">= 2.7.0"
gem "neat"
gem "normalize-rails"
gem "paperclip", "~> 6.1.0"
gem "pg"
gem "pikaday-gem", "~> 1.2.0.0"
gem "rack-timeout"
gem "rails", "~> 5.2.6", ">= 5.2.6.2"
gem "recipient_interceptor"
gem "redcarpet"
gem "sass-rails", "~> 5.0.7"
gem "select2-rails"
gem "simple_form", ">= 5.0.1"
gem "sprockets-rails", "~> 3.2", ">= 3.2.1"
gem "title", ">= 0.0.7"
gem "twitter-text" # hashtag parsing
gem "uglifier"
gem "unicorn"

source "https://rails-assets.org" do
  gem "rails-assets-chartjs"
end

# caching

gem "dalli" # memcached
gem "memcachier"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "foreman"
  gem "pry"
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "annotate"
  gem "dotenv-rails"
  gem "email_spec"
  gem "factory_girl_rails", ">= 4.4.1"
  gem "letter_opener"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.8", ">= 3.8.2"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers", "~> 2.7.0"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "newrelic_rpm", ">= 3.7.3"
  gem "rails_12factor"
end
